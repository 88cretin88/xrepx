/*
This file is part of GameHub.
Copyright (C) 2018-2019 Anatoliy Kashkin

GameHub is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

GameHub is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GameHub.  If not, see <https://www.gnu.org/licenses/>.
*/

using Gee;
using Gtk;

using GameHub.Utils;
using GameHub.Data.DB;

namespace GameHub.Data
{
	public abstract class Runnable: Object
	{
		public string id { get; protected set; }

		private string _name;
		public string escaped_name { get; set; }
		public string normalized_name { get; set; }

		public string name
		{
			get
			{
				return _name;
			}
			set
			{
				_name = value;
				escaped_name = Utils.strip_name(_name.replace(" ", "_"), "_.,");
				normalized_name = Utils.strip_name(_name, null, true);
			}
		}

		public string? compat_tool { get; set; }
		public string? compat_tool_settings { get; set; }

		public string? arguments { get; set; }

		public bool is_running { get; set; default = false; }

		public ArrayList<Platform> platforms { get; protected set; default = new ArrayList<Platform>(); }
		public virtual bool is_supported(Platform? platform=null, bool with_compat=true)
		{
			platform = platform ?? Platform.CURRENT;
			if(platforms == null || platforms.size == 0 || platform in platforms) return true;
			if(!with_compat) return false;
			foreach(var tool in CompatTools)
			{
				if(tool.can_run(this)) return true;
			}
			return false;
		}

		public abstract File? executable { owned get; set; }
		public File? install_dir { get; set; }
		public abstract File? work_dir { owned get; set; }
		public virtual File? default_install_dir { owned get { return null; } }

		public ArrayList<RunnableAction> actions { get; protected set; default = new ArrayList<RunnableAction>(); }

		public abstract async void install(Runnable.Installer.InstallMode install_mode=Runnable.Installer.InstallMode.INTERACTIVE);
		public abstract async void run();

		public virtual bool can_be_launched(bool is_launch_attempt=false)
		{
			if(Runnable.IsLaunched || Sources.Steam.Steam.IsAnyAppRunning || is_running) return false;
			if(is_launch_attempt)
			{
				lock(Runnable.LastLaunchAttempt)
				{
					var launch_attempt = Runnable.LastLaunchAttempt;
					var now = get_real_time();
					Runnable.LastLaunchAttempt = now;
					if(now - launch_attempt < 1000000) return false;
				}
			}
			return true;
		}

		public virtual async void run_with_compat(bool is_opened_from_menu=false)
		{
			if(can_be_launched(true))
			{
				var dlg = new UI.Dialogs.CompatRunDialog(this, is_opened_from_menu);
				dlg.destroy.connect(() => {
					Idle.add(run_with_compat.callback);
				});
				yield;
			}
		}

		public virtual FileChooser setup_executable_chooser()
		{
			#if GTK_3_22
			var chooser = new FileChooserNative(_("Select executable"), GameHub.UI.Windows.MainWindow.instance, FileChooserAction.OPEN, _("Select"), _("Cancel"));
			#else
			var chooser = new FileChooserDialog(_("Select executable"), GameHub.UI.Windows.MainWindow.instance, FileChooserAction.OPEN, _("Select"), ResponseType.ACCEPT, _("Cancel"), ResponseType.CANCEL);
			#endif

			try
			{
				chooser.set_file(executable);
			}
			catch(Error e)
			{
				warning(e.message);
			}

			return chooser;
		}

		private int run_executable_chooser(FileChooser chooser)
		{
			#if GTK_3_22
			return (chooser as FileChooserNative).run();
			#else
			return (chooser as FileChooserDialog).run();
			#endif
		}

		public virtual void choose_executable(bool update=true)
		{
			var chooser = setup_executable_chooser();

			if(run_executable_chooser(chooser) == ResponseType.ACCEPT)
			{
				set_chosen_executable(chooser.get_file(), update);
			}
		}

		public virtual void set_chosen_executable(File? file, bool update=true)
		{
			executable = file;
			if(executable != null && executable.query_exists())
			{
				Utils.run({"chmod", "+x", executable.get_path()}).run_sync();
			}

			if(update)
			{
				update_status();
				save();
			}
		}

		public virtual void save(){}
		public virtual void update_status(){}

		public virtual void import(bool update=true)
		{
			var chooser = new FileChooserDialog(_("Select directory"), GameHub.UI.Windows.MainWindow.instance, FileChooserAction.SELECT_FOLDER);

			var games_dir = "";
			if(this is Sources.GOG.GOGGame)
			{
				games_dir = FSUtils.Paths.GOG.Games;
			}
			else if(this is Sources.Humble.HumbleGame)
			{
				games_dir = FSUtils.Paths.Humble.Games;
			}

			chooser.set_current_folder(games_dir);

			chooser.add_button(_("Cancel"), ResponseType.CANCEL);
			var select_btn = chooser.add_button(_("Select"), ResponseType.ACCEPT);

			select_btn.get_style_context().add_class(Gtk.STYLE_CLASS_SUGGESTED_ACTION);
			select_btn.grab_default();

			if(chooser.run() == ResponseType.ACCEPT)
			{
				install_dir = chooser.get_file();
				work_dir = install_dir;
				executable = FSUtils.file(install_dir.get_path(), "start.sh");

				if(!executable.query_exists())
				{
					choose_executable(false);
				}

				if(executable.query_exists())
				{
					Utils.run({"chmod", "+x", executable.get_path()}).run_sync();
				}

				if(update)
				{
					update_status();
					save();
				}
			}

			chooser.destroy();
		}

		public bool use_compat
		{
			get
			{
				return needs_compat || force_compat;
			}
		}

		public bool needs_compat
		{
			get
			{
				return (!is_supported(null, false) && is_supported(null, true)) || (executable != null && executable.get_basename().down().has_suffix(".exe"));
			}
		}

		public bool force_compat
		{
			get
			{
				if(this is Sources.Steam.SteamGame) return false;
				if(get_compat_option_bool("force_compat") == true) return true;
				return false;
			}
			set
			{
				if(this is Sources.Steam.SteamGame) return;
				set_compat_option_bool("force_compat", value);
				notify_property("use-compat");
			}
		}

		public bool compat_options_saved
		{
			get
			{
				if(this is Sources.Steam.SteamGame) return false;
				return get_compat_option_bool("compat_options_saved") == true;
			}
			set
			{
				if(this is Sources.Steam.SteamGame) return;
				set_compat_option_bool("compat_options_saved", value);
			}
		}

		public Json.Object get_compat_settings(CompatTool tool)
		{
			if(compat_tool_settings != null && compat_tool_settings.length > 0)
			{
				var root = Parser.parse_json(compat_tool_settings);
				var settings = Parser.json_object(root, { tool.id });
				if(settings != null)
				{
					return settings;
				}
			}
			return new Json.Object();
		}

		public void set_compat_settings(CompatTool tool, Json.Object? settings)
		{
			var root_object = new Json.Object();
			if(compat_tool_settings != null && compat_tool_settings.length > 0)
			{
				var root = Parser.parse_json(compat_tool_settings);
				if(root != null && root.get_node_type() == Json.NodeType.OBJECT)
				{
					root_object = root.get_object();
				}
			}

			if(settings == null)
			{
				root_object.remove_member(tool.id);
			}
			else
			{
				root_object.set_object_member(tool.id, settings);
			}

			var root_node = new Json.Node(Json.NodeType.OBJECT);
			root_node.set_object(root_object);
			compat_tool_settings = Json.to_string(root_node, false);
			compat_options_saved = true;
			save();
		}

		public bool? get_compat_option_bool(string key)
		{
			if(compat_tool_settings != null && compat_tool_settings.length > 0)
			{
				var root = Parser.parse_json(compat_tool_settings);
				if(root != null && root.get_node_type() == Json.NodeType.OBJECT)
				{
					var obj = root.get_object();
					if(obj.has_member(key)) return obj.get_boolean_member(key);
				}
			}
			return null;
		}

		public void set_compat_option_bool(string key, bool? value)
		{
			var root_object = new Json.Object();
			if(compat_tool_settings != null && compat_tool_settings.length > 0)
			{
				var root = Parser.parse_json(compat_tool_settings);
				if(root != null && root.get_node_type() == Json.NodeType.OBJECT)
				{
					root_object = root.get_object();
				}
			}
			if(value != null)
			{
				root_object.set_boolean_member(key, value);
			}
			else
			{
				root_object.remove_member(key);
			}
			var root_node = new Json.Node(Json.NodeType.OBJECT);
			root_node.set_object(root_object);
			compat_tool_settings = Json.to_string(root_node, false);
			save();
		}

		public static bool IsLaunched = false;
		public static int64 LastLaunchAttempt = 0;

		public abstract class Installer
		{
			public string   id         { get; protected set; }
			public Platform platform   { get; protected set; default = Platform.CURRENT; }
			public int64    full_size  { get; protected set; default = 0; }
			public string?  version    { get; protected set; }

			public virtual string name { owned get { return id; } }

			public abstract async void install(Runnable runnable, CompatTool? tool=null);

			public static async InstallerType guess_type(File file, bool is_part=false)
			{
				var type = InstallerType.UNKNOWN;
				if(file == null) return type;

				try
				{
					var finfo = yield file.query_info_async(FileAttribute.STANDARD_CONTENT_TYPE, FileQueryInfoFlags.NONE);
					var mime = finfo.get_content_type();
					type = InstallerType.from_mime(mime);

					if(type != InstallerType.UNKNOWN) return type;

					var info = Utils.run({"file", "-bi", file.get_path()}).log(false).run_sync(true).output;
					if(info != null && info.length > 0)
					{
						mime = info.split(";")[0];
						if(mime != null && mime.length > 0)
						{
							type = InstallerType.from_mime(mime);
						}
					}

					if(type != InstallerType.UNKNOWN) return type;

					string[] gog_part_ext = {"bin"};
					string[] exe_ext = {"sh", "elf", "bin", "run"};
					string[] win_exe_ext = {"exe", "msi"};
					string[] arc_ext = {"zip", "tar", "cpio", "bz2", "gz", "lz", "lzma", "7z", "rar"};

					if(is_part)
					{
						foreach(var ext in gog_part_ext)
						{
							if(file.get_basename().down().has_suffix(@".$(ext)")) return InstallerType.GOG_PART;
						}
					}

					foreach(var ext in exe_ext)
					{
						if(file.get_basename().down().has_suffix(@".$(ext)")) return InstallerType.EXECUTABLE;
					}
					foreach(var ext in win_exe_ext)
					{
						if(file.get_basename().down().has_suffix(@".$(ext)")) return InstallerType.WINDOWS_EXECUTABLE;
					}
					foreach(var ext in arc_ext)
					{
						if(file.get_basename().down().has_suffix(@".$(ext)")) return InstallerType.ARCHIVE;
					}
				}
				catch(Error e){}

				return type;
			}

			public enum InstallerType
			{
				UNKNOWN, EXECUTABLE, WINDOWS_EXECUTABLE, GOG_PART, ARCHIVE, WINDOWS_NSIS_INSTALLER;

				public static InstallerType from_mime(string type)
				{
					switch(type.strip())
					{
						case "application/x-executable":
						case "application/x-elf":
						case "application/x-sh":
						case "application/x-shellscript":
							return InstallerType.EXECUTABLE;

						case "application/x-dosexec":
						case "application/x-ms-dos-executable":
						case "application/dos-exe":
						case "application/exe":
						case "application/msdos-windows":
						case "application/x-exe":
						case "application/x-msdownload":
						case "application/x-winexe":
						case "application/x-msi":
							return InstallerType.WINDOWS_EXECUTABLE;

						case "application/octet-stream":
							return InstallerType.GOG_PART;

						case "application/zip":
						case "application/x-tar":
						case "application/x-gtar":
						case "application/x-cpio":
						case "application/x-bzip2":
						case "application/gzip":
						case "application/x-lzip":
						case "application/x-lzma":
						case "application/x-7z-compressed":
						case "application/x-rar-compressed":
						case "application/x-compressed-tar":
							return InstallerType.ARCHIVE;
					}
					return InstallerType.UNKNOWN;
				}
			}

			public enum InstallMode
			{
				INTERACTIVE, AUTOMATIC, AUTOMATIC_DOWNLOAD
			}
		}

		public abstract class FileInstaller: Installer
		{
			private const string NSIS_INSTALLER_DESCRIPTION = "Nullsoft Installer";

			public File? file { get; protected set; }
			public int64 size { get; protected set; }

			public override async void install(Runnable runnable, CompatTool? tool=null)
			{
				yield install_file(file, false, runnable, tool);
			}

			public static async void install_file(File? file, bool is_part, Runnable runnable, CompatTool? tool=null, out bool is_windows_installer=null, out bool is_nsis_installer=null)
			{
				is_windows_installer = false;
				is_nsis_installer = false;

				if(file == null || !file.query_exists()) return;

				Game? game = null;
				if(runnable is Game)
				{
					game = runnable as Game;
				}

				var path = file.get_path();
				Utils.run({"chmod", "+x", path}).run_sync();

				FSUtils.mkdir(runnable.install_dir.get_path());

				var type = yield guess_type(file, is_part);

				if(type == InstallerType.WINDOWS_EXECUTABLE && tool is Compat.Innoextract)
				{
					var desc = Utils.run({"file", "-b", path}).log(false).run_sync(true).output;
					if(desc != null && desc.length > 0 && NSIS_INSTALLER_DESCRIPTION in desc)
					{
						type = InstallerType.WINDOWS_NSIS_INSTALLER;
					}
				}

				string[]? cmd = null;

				switch(type)
				{
					case InstallerType.EXECUTABLE:
						cmd = {path, "--", "--i-agree-to-all-licenses",
								"--noreadme", "--nooptions", "--noprompt",
								"--destination", runnable.install_dir.get_path().replace("'", "\\'")}; // probably mojosetup
						break;

					case InstallerType.ARCHIVE:
					case InstallerType.WINDOWS_NSIS_INSTALLER:
						cmd = {"file-roller", path, "-e", runnable.install_dir.get_path()}; // extract with file-roller
						break;

					case InstallerType.WINDOWS_EXECUTABLE:
					case InstallerType.GOG_PART:
						cmd = null; // use compattool later
						break;

					default:
						cmd = {"xdg-open", path}; // unknown type, just open
						break;
				}

				if(game != null) game.status = new Game.Status(Game.State.INSTALLING, game);

				if(cmd != null)
				{
					yield Utils.run(cmd).run_async();
				}
				if(type == InstallerType.WINDOWS_EXECUTABLE)
				{
					is_windows_installer = true;
					if(tool != null && tool.can_install(runnable))
					{
						yield tool.install(runnable, file);
					}
				}
				else if(type == InstallerType.WINDOWS_NSIS_INSTALLER)
				{
					is_nsis_installer = true;
				}
			}
		}

		public abstract class DownloadableInstaller: Installer
		{
			public class Part: Object
			{
				public string       id            { get; construct set; }
				public string       url           { get; construct set; }
				public int64        size          { get; construct set; }
				public File?        remote        { get; construct set; }
				public File?        local         { get; construct set; }
				public string?      checksum      { get; construct set; }
				public ChecksumType checksum_type { get; construct set; }
				public Part(string id, string url, int64 size, File remote, File local, string? checksum=null, ChecksumType checksum_type=ChecksumType.MD5)
				{
					Object(id: id, url: url, size: size, remote: remote, local: local, checksum: checksum, checksum_type: checksum_type);
				}
				public string? checksum_type_string
				{
					get
					{
						if(checksum == null || checksum.length == 0) return null;
						switch(checksum_type)
						{
							case ChecksumType.MD5: return "md5";
							case ChecksumType.SHA1: return "sha1";
							case ChecksumType.SHA256: return "sha256";
							case ChecksumType.SHA512: return "sha512";
						}
						return null;
					}
				}
			}

			public ArrayList<Part> parts { get; protected set; default = new ArrayList<Part>(); }
			public virtual async void fetch_parts(){}

			public async ArrayList<File> download(Runnable runnable)
			{
				var files = new ArrayList<File>();
				try
				{
					Game? game = null;
					if(runnable is Game)
					{
						game = runnable as Game;
					}

					if(game != null) game.status = new Game.Status(Game.State.DOWNLOADING, game, null);

					var runnable_install_dir = runnable.install_dir ?? runnable.default_install_dir;
					if(runnable_install_dir == null) return files;
					runnable.install_dir = runnable_install_dir;

					uint p = 1;
					foreach(var part in parts)
					{
						FSUtils.mkdir(part.local.get_parent().get_path());

						var ds_id = Downloader.download_manager().file_download_started.connect(dl => {
							if(dl.remote != part.remote) return;
							if(game != null)
							{
								game.status = new Game.Status(Game.State.DOWNLOADING, game, dl);
								dl.status_change.connect(s => {
									game.status_change(game.status);
								});
							}
						});

						var partDesc = part.id;

						if(parts.size > 1)
						{
							partDesc = _("Part %1$u of %2$u: %3$s").printf(p, parts.size, part.id);
						}

						var info = new Downloader.DownloadInfo(runnable.name, partDesc, game != null ? game.icon : null, null, null, game != null ? game.source.icon : null);
						var file = yield Downloader.download_file(part.remote, part.local, info);
						if(file != null && file.query_exists())
						{
							string? file_checksum = null;
							if(part.checksum != null)
							{
								FileUtils.set_contents(file.get_path() + "." + part.checksum_type_string, part.checksum);
								if(game != null) game.status = new Game.Status(Game.State.VERIFYING_INSTALLER_INTEGRITY, game);
								file_checksum = yield Utils.compute_file_checksum(file, part.checksum_type);
								if(game != null) game.status = new Game.Status(Game.State.DOWNLOADING, game, null);
							}

							if(part.checksum == null || file_checksum == null || part.checksum == file_checksum)
							{
								files.add(file);
							}
							else
							{
								Utils.notify(
									_("%s: corrupted installer").printf(runnable.name),
									_("Checksum mismatch in %s").printf(file.get_basename()),
									NotificationPriority.HIGH,
									n => {
										n.set_icon(new ThemedIcon("dialog-warning"));
										if(game != null)
										{
											var icon = ImageCache.local_file(game.icon, @"games/$(game.source.id)/$(game.id)/icons/");
											if(icon != null && icon.query_exists())
											{
												n.set_icon(new FileIcon(icon));
											}
										}
										var args = new Variant("(ss)", game != null ? game.full_id : runnable.id, file.get_path());
										n.set_default_action_and_target_value(Application.ACTION_PREFIX + Application.ACTION_CORRUPTED_INSTALLER_PICK_ACTION, args);
										n.add_button_with_target_value(_("Show file"), Application.ACTION_PREFIX + Application.ACTION_CORRUPTED_INSTALLER_SHOW, args);
										n.add_button_with_target_value(_("Remove"), Application.ACTION_PREFIX + Application.ACTION_CORRUPTED_INSTALLER_REMOVE, args);
										n.add_button_with_target_value(_("Backup"), Application.ACTION_PREFIX + Application.ACTION_CORRUPTED_INSTALLER_BACKUP, args);
										return n;
									}
								);

								warning("Checksum mismatch in `%s`, skipping; expected: `%s`, actual: `%s`", file.get_basename(), part.checksum, file_checksum);
							}
						}
						Downloader.download_manager().disconnect(ds_id);

						p++;
					}

					if(game != null) game.status = new Game.Status(Game.State.UNINSTALLED, game);
					runnable.update_status();
				}
				catch(IOError.CANCELLED e){}
				catch(Error e)
				{
					warning("[DownloadableInstaller.download] %s", e.message);
				}
				return files;
			}

			public override async void install(Runnable runnable, CompatTool? tool=null)
			{
				try
				{
					var files = yield download(runnable);

					Game? game = null;
					if(runnable is Game)
					{
						game = runnable as Game;
					}

					if(game != null) game.status = new Game.Status(Game.State.UNINSTALLED, game);
					runnable.update_status();

					if(files.size == 0) return;

					uint f = 0;
					bool windows_installer = false;
					bool nsis_installer = false;
					foreach(var file in files)
					{
						bool win;
						bool nsis;
						yield FileInstaller.install_file(file, f++ > 0, runnable, tool, out win, out nsis);
						windows_installer = windows_installer || win;
						nsis_installer = nsis_installer || nsis;
					}

					try
					{
						if(nsis_installer)
						{
							FSUtils.rm(runnable.install_dir.get_path(), "\\$*DIR", "-rf"); // remove anything like $PLUGINSDIR
						}

						int dircount = 0;
						string? dirname = null;
						FileInfo? finfo = null;
						var enumerator = yield runnable.install_dir.enumerate_children_async("standard::*", FileQueryInfoFlags.NOFOLLOW_SYMLINKS);
						while((finfo = enumerator.next_file()) != null)
						{
							if(finfo.get_file_type() == FileType.DIRECTORY && finfo.get_name() != FSUtils.GAMEHUB_DIR)
							{
								dircount++;
								dirname = dirname == null && dircount == 1 ? finfo.get_name() : null;
							}
							else if(finfo.get_file_type() != FileType.DIRECTORY)
							{
								dirname = null;
								break;
							}
						}

						if(dirname != null && !(runnable is GameHub.Data.Sources.GOG.GOGGame.DLC))
						{
							FSUtils.mv_up(runnable.install_dir, dirname.replace(" ", "\\ "));
						}

						if(windows_installer || platform == Platform.WINDOWS)
						{
							runnable.force_compat = true;
						}
					}
					catch(Error e){}

					runnable.update_status();

					if(runnable is GameHub.Data.Sources.GOG.GOGGame && !(runnable is GameHub.Data.Sources.GOG.GOGGame.DLC) && (runnable.executable == null || !runnable.executable.query_exists()))
					{
						if(runnable.actions != null && runnable.actions.size > 0)
						{
							foreach(var action in runnable.actions)
							{
								if(action.is_primary)
								{
									if(action.file != null && action.file.query_exists())
									{
										runnable.executable = action.file;
										runnable.work_dir = action.workdir;
										runnable.arguments = action.args;
										break;
									}
								}
							}
						}

						runnable.update_status();
					}

					if((runnable.executable == null || !runnable.executable.query_exists()) && !(runnable is GameHub.Data.Sources.GOG.GOGGame.DLC))
					{
						if(game != null)
						{
							Utils.notify(
								_("%s: cannot detect main executable").printf(game.name),
								_("Main executable file for this game cannot be detected automatically.\nPlease set main executable in game's properties."),
								NotificationPriority.HIGH,
								n => {
									n.set_icon(new ThemedIcon("dialog-warning"));
									if(game != null)
									{
										var icon = ImageCache.local_file(game.icon, @"games/$(game.source.id)/$(game.id)/icons/");
										if(icon != null && icon.query_exists())
										{
											n.set_icon(new FileIcon(icon));
										}
									}
									n.set_default_action_and_target_value(Application.ACTION_PREFIX + Application.ACTION_GAME_PROPERTIES, new Variant.string(game.full_id));
									return n;
								}
							);
						}
						else
						{
							runnable.choose_executable();
						}
					}

					if(game != null && version != null)
					{
						game.save_version(version);
					}

					var gh_marker = runnable.install_dir.get_child(".gamehub_" + runnable.id);
					if(gh_marker != null)
					{
						FileUtils.set_contents(gh_marker.get_path(), "");
					}
				}
				catch(Error e)
				{
					warning("[DownloadableInstaller.install] %s", e.message);
				}
				runnable.update_status();
			}
		}

		public abstract class RunnableAction
		{
			public Runnable runnable     { get; protected set; }

			public bool     is_primary   { get; protected set; default = false; }
			public bool     is_hidden    { get; protected set; default = false; }
			public string   name         { get; protected set; }
			public File?    file         { get; protected set; }
			public File?    workdir      { get; protected set; }
			public string?  args         { get; protected set; }
			public Type?[]  compat_tools { get; protected set; default = { null }; }
			public string?  uri          { get; protected set; }

			public bool is_available(CompatTool? tool=null)
			{
				if(file == null && uri != null)
				{
					return true;
				}

				if(tool == null)
				{
					return compat_tools.length == 0 || compat_tools[0] == null;
				}

				var t = tool.get_type();

				foreach(var type in compat_tools)
				{
					if(type != null && t.is_a(type))
					{
						return true;
					}
				}

				return false;
			}

			public async void invoke(CompatTool? tool=null)
			{
				if(file == null && uri != null)
				{
					Utils.open_uri(uri);
					return;
				}

				if(is_available(tool) && tool.can_run_action(runnable, this))
				{
					yield tool.run_action(runnable, this);
				}
			}
		}
	}

	public enum Platform
	{
		LINUX, WINDOWS, MACOS, EMULATED;

		public const Platform[] PLATFORMS = { Platform.LINUX, Platform.WINDOWS, Platform.MACOS, Platform.EMULATED };

		#if OS_LINUX
		public const Platform CURRENT = Platform.LINUX;
		#elif OS_WINDOWS
		public const Platform CURRENT = Platform.WINDOWS;
		#elif OS_MACOS
		public const Platform CURRENT = Platform.MACOS;
		#endif

		public string id()
		{
			switch(this)
			{
				case Platform.LINUX:    return "linux";
				case Platform.WINDOWS:  return "windows";
				case Platform.MACOS:    return "mac";
				case Platform.EMULATED: return "emulated";
			}
			assert_not_reached();
		}

		public string name()
		{
			switch(this)
			{
				case Platform.LINUX:    return "Linux";
				case Platform.WINDOWS:  return "Windows";
				case Platform.MACOS:    return "macOS";
				case Platform.EMULATED: return C_("platform", "Emulated");
			}
			assert_not_reached();
		}

		public string icon()
		{
			switch(this)
			{
				case Platform.LINUX:    return "platform-linux-symbolic";
				case Platform.WINDOWS:  return "platform-windows-symbolic";
				case Platform.MACOS:    return "platform-macos-symbolic";
				case Platform.EMULATED: return "gamehub-symbolic";
			}
			assert_not_reached();
		}
	}
}
