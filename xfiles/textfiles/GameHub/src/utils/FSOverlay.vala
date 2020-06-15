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

using GLib;
using Gee;

namespace GameHub.Utils
{
	public class FSOverlay: Object
	{
		private const string POLKIT_ACTION = ProjectConfig.PROJECT_NAME + ".polkit.overlayfs-helper";
		private const string POLKIT_HELPER = ProjectConfig.BINDIR + "/" + ProjectConfig.PROJECT_NAME + "-overlayfs-helper";
		private static Permission? permission;

		public string          id       { get; construct set; }
		public File            target   { get; construct set; }
		public ArrayList<File> overlays { get; construct set; }
		public File?           persist  { get; construct set; }
		public File?           workdir  { get; construct set; }

		public FSOverlay(File target, ArrayList<File> overlays, File? persist=null, File? workdir=null)
		{
			Object(
				id: ProjectConfig.PROJECT_NAME + "_overlay_" + Utils.md5(target.get_path()),
				target: target, overlays: overlays, persist: persist, workdir: workdir
			);
		}

		construct
		{
			if(persist != null && workdir == null)
			{
				workdir = FSUtils.file(persist.get_parent().get_path(), ".gh." + persist.get_basename() + ".overlay_workdir");
			}
		}

		private string? _options;
		public string options
		{
			get
			{
				if(_options != null) return _options;

				string[] options_arr = {};

				string[] overlay_dirs = {};

				for(var i = overlays.size - 1; i >= 0; i--)
				{
					overlay_dirs += overlays.get(i).get_path();
				}

				options_arr += "index=off,lowerdir=" + string.joinv(":", overlay_dirs);

				if(persist != null && workdir != null)
				{
					options_arr += "upperdir=" + persist.get_path();
					options_arr += "workdir=" + workdir.get_path();
					try
					{
						if(!persist.query_exists()) persist.make_directory_with_parents();
						if(!workdir.query_exists()) workdir.make_directory_with_parents();
					}
					catch(Error e)
					{
						warning("[FSOverlay.mount] Error while creating directories: %s", e.message);
					}
				}

				_options = string.joinv(",", options_arr);
				return _options;
			}
		}

		public async void mount()
		{
			yield umount();

			try
			{
				if(!target.query_exists()) target.make_directory_with_parents();
			}
			catch(Error e)
			{
				warning("[FSOverlay.mount] Error while creating target directory: %s", e.message);
			}

			yield polkit_authenticate();

			yield Utils.run({"pkexec", POLKIT_HELPER, "mount", id, options, target.get_path()}).log(GameHub.Application.log_verbose).run_sync_thread();
		}

		public async void umount()
		{
			yield polkit_authenticate();

			while(id in (yield Utils.run({"mount"}).log(false).run_sync_thread(true)).output)
			{
				yield Utils.run({"pkexec", POLKIT_HELPER, "umount", id}).log(GameHub.Application.log_verbose).run_sync_thread();
				yield Utils.sleep_async(500);
			}

			if(workdir != null && !workdir.query_exists())
			{
				FSUtils.rm(workdir.get_path(), null, "-rf");
			}
		}

		private async void polkit_authenticate()
		{
			#if POLKIT
			if(permission == null)
			{
				try
				{
					permission = yield new Polkit.Permission(POLKIT_ACTION, null);
				}
				catch(Error e)
				{
					warning("[FSOverlay.polkit_authenticate] %s", e.message);
				}
			}

			if(permission != null && !permission.allowed && permission.can_acquire)
			{
				try
				{
					yield permission.acquire_async();
				}
				catch(Error e)
				{
					warning("[FSOverlay.polkit_authenticate] %s", e.message);
				}
			}
			#endif
		}

		public enum RootPathSafety
		{
			SAFE, UNSAFE, RESTRICTED;

			private const string[] ALLOWED_PATHS = { "/home/", "/mnt/", "/media/", "/run/media/", "/opt/", "/var/opt/" };

			public static RootPathSafety for(File? root)
			{
				if(root == null || !root.query_exists()) return RESTRICTED;
				var path = root.get_path().down();

				var allowed = false;
				foreach(var prefix in ALLOWED_PATHS)
				{
					if(path.has_prefix(prefix))
					{
						allowed = true;
						break;
					}
				}

				if(!allowed)
				{
					return RESTRICTED;
				}

				string[] safe_paths = {};

				if(Data.Sources.GOG.GOG.instance.enabled)
					safe_paths += FSUtils.Paths.GOG.Games.down();
				if(Data.Sources.Humble.Humble.instance.enabled)
					safe_paths += FSUtils.Paths.Humble.Games.down();

				foreach(var safe_path in safe_paths)
				{
					if(path.has_prefix(safe_path))
					{
						return SAFE;
					}
				}

				return UNSAFE;
			}
		}
	}
}
