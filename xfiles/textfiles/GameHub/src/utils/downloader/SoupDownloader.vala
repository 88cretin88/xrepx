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
using Soup;

using GameHub.Utils.Downloader;

namespace GameHub.Utils.Downloader.SoupDownloader
{
	public class SoupDownloader: Downloader
	{
		private Session session;

		private HashTable<string, SoupDownload> downloads;
		private HashTable<string, DownloadInfo> dl_info;
		private ArrayQueue<string> dl_queue;

		private static string[] URL_SCHEMES = { "http", "https" };
		private static string[] FILENAME_BLACKLIST = { "download" };

		public SoupDownloader()
		{
			downloads = new HashTable<string, SoupDownload>(str_hash, str_equal);
			dl_info = new HashTable<string, DownloadInfo>(str_hash, str_equal);
			dl_queue = new ArrayQueue<string>();
			session = new Session();
			session.max_conns = 32;
			session.max_conns_per_host = 16;
		}

		public override Download? get_download(string id)
		{
			lock(downloads)
			{
				return downloads.get(id);
			}
		}

		public SoupDownload? get_file_download(File? remote)
		{
			if(remote == null) return null;
			lock(downloads)
			{
				return (SoupDownload?) downloads.get(remote.get_uri());
			}
		}

		public async File? download(File remote, File local, DownloadInfo? info=null, bool preserve_filename=true, bool queue=true) throws Error
		{
			if(remote == null || remote.get_uri() == null || remote.get_uri().length == 0) return null;

			var uri = remote.get_uri();
			var download = get_file_download(remote);

			if(download != null) return yield await_download(download);

			if(local.query_exists())
			{
				if(GameHub.Application.log_downloader)
				{
					debug("[SoupDownloader] '%s' is already downloaded", uri);
				}
				return local;
			}

			var tmp = File.new_for_path(local.get_path() + "~");

			download = new SoupDownload(remote, local, tmp);
			download.session = session;

			lock(downloads)
			{
				downloads.set(uri, download);
			}

			download_started(download);

			if(info != null)
			{
				info.download = download;

				lock(dl_info)
				{
					dl_info.set(uri, info);
				}

				dl_started(info);
			}

			if(GameHub.Application.log_downloader)
			{
				debug("[SoupDownloader] Downloading '%s'...", uri);
			}

			download.status = new FileDownload.Status(Download.State.STARTING);

			try
			{
				if(remote.get_uri_scheme() in URL_SCHEMES)
					yield download_from_http(download, preserve_filename, queue);
				else
					yield download_from_filesystem(download);
			}
			catch(IOError.CANCELLED error)
			{
				download.status = new FileDownload.Status(Download.State.CANCELLED);
				download_cancelled(download, error);
				if(info != null) dl_ended(info);
				throw error;
			}
			catch(Error error)
			{
				download.status = new FileDownload.Status(Download.State.FAILED);
				download_failed(download, error);
				if(info != null) dl_ended(info);
				throw error;
			}
			finally
			{
				lock(downloads) downloads.remove(uri);
				lock(dl_info)   dl_info.remove(uri);
				lock(dl_queue)  dl_queue.remove(uri);
			}

			if(download.local_tmp.query_exists())
			{
				download.local_tmp.move(download.local, FileCopyFlags.OVERWRITE);
			}

			if(GameHub.Application.log_downloader)
			{
				debug("[SoupDownloader] Downloaded '%s'", uri);
			}

			download_finished(download);
			if(info != null) dl_ended(info);

			return download.local;
		}

		private async void download_from_http(SoupDownload download, bool preserve_filename=true, bool queue=true) throws Error
		{
			var msg = new Message("GET", download.remote.get_uri());
			msg.response_body.set_accumulate(false);

			download.session = session;
			download.message = msg;

			if(queue)
			{
				yield await_queue(download);
				download.status = new FileDownload.Status(Download.State.STARTING);
			}

			if(download.is_cancelled)
			{
				throw new IOError.CANCELLED("Download cancelled by user");
			}

			#if !PKG_FLATPAK
			var address = msg.get_address();
			var connectable = new NetworkAddress(address.name, (uint16) address.port);
			var network_monitor = NetworkMonitor.get_default();
			if(!(yield network_monitor.can_reach_async(connectable)))
				throw new IOError.HOST_UNREACHABLE("Failed to reach host");
			#endif

			GLib.Error? err = null;

			FileOutputStream? local_stream = null;

			int64 dl_bytes = 0;
			int64 dl_bytes_total = 0;

			#if SOUP_2_60
			int64 resume_from = 0;
			var resume_dl = false;

			if(download.local_tmp.get_basename().has_suffix("~") && download.local_tmp.query_exists())
			{
				var info = yield download.local_tmp.query_info_async(FileAttribute.STANDARD_SIZE, FileQueryInfoFlags.NONE);
				resume_from = info.get_size();
				if(resume_from > 0)
				{
					resume_dl = true;
					msg.request_headers.set_range(resume_from, -1);
					if(GameHub.Application.log_downloader)
					{
						debug(@"[SoupDownloader] Download part found, size: $(resume_from)");
					}
				}
			}
			#endif

			msg.got_headers.connect(() => {
				dl_bytes_total = msg.response_headers.get_content_length();
				if(GameHub.Application.log_downloader)
				{
					debug(@"[SoupDownloader] Content-Length: $(dl_bytes_total)");
				}
				try
				{
					if(preserve_filename)
					{
						string filename = null;
						string disposition = null;
						HashTable<string, string> dparams = null;

						if(msg.response_headers.get_content_disposition(out disposition, out dparams))
						{
							if(disposition == "attachment" && dparams != null)
							{
								filename = dparams.get("filename");
								if(filename != null && GameHub.Application.log_downloader)
								{
									debug(@"[SoupDownloader] Content-Disposition: filename=%s", filename);
								}
							}
						}

						if(filename == null)
						{
							filename = download.remote.get_basename();
						}

						if(filename != null && !(filename in FILENAME_BLACKLIST))
						{
							download.local = download.local.get_parent().get_child(filename);
						}
					}

					if(download.local.query_exists())
					{
						if(GameHub.Application.log_downloader)
						{
							debug(@"[SoupDownloader] '%s' exists", download.local.get_path());
						}
						var info = download.local.query_info(FileAttribute.STANDARD_SIZE, FileQueryInfoFlags.NONE);
						if(info.get_size() == dl_bytes_total)
						{
							session.cancel_message(msg, Status.OK);
							return;
						}
					}
					if(GameHub.Application.log_downloader)
					{
						debug(@"[SoupDownloader] Downloading to '%s'", download.local.get_path());
					}

					#if SOUP_2_60
					int64 rstart = -1, rend = -1;
					if(resume_dl && msg.response_headers.get_content_range(out rstart, out rend, out dl_bytes_total))
					{
						if(GameHub.Application.log_downloader)
						{
							debug(@"[SoupDownloader] Content-Range is supported($(rstart)-$(rend)), resuming from $(resume_from)");
							debug(@"[SoupDownloader] Content-Length: $(dl_bytes_total)");
						}
						dl_bytes = resume_from;
						local_stream = download.local_tmp.append_to(FileCreateFlags.NONE);
					}
					else
					#endif
					{
						local_stream = download.local_tmp.replace(null, false, FileCreateFlags.REPLACE_DESTINATION);
					}
				}
				catch(Error e)
				{
					warning(e.message);
				}
			});

			int64 last_update = 0;
			int64 dl_bytes_from_last_update = 0;

			msg.got_chunk.connect((msg, chunk) => {
				if(session.would_redirect(msg) || local_stream == null) return;

				dl_bytes += chunk.length;
				dl_bytes_from_last_update += chunk.length;
				try
				{
					local_stream.write(chunk.data);
					chunk.free();

					int64 now = get_real_time();
					int64 diff = now - last_update;
					if(diff > 1000000)
					{
						int64 dl_speed = (int64) (((double) dl_bytes_from_last_update) / ((double) diff) * ((double) 1000000));
						download.status = new FileDownload.Status(Download.State.DOWNLOADING, dl_bytes, dl_bytes_total, dl_speed);
						last_update = now;
						dl_bytes_from_last_update = 0;
					}
				}
				catch(Error e)
				{
					err = e;
					session.cancel_message(msg, Status.CANCELLED);
				}
			});

			session.queue_message(msg, (session, msg) => {
				download_from_http.callback();
			});

			yield;

			if(local_stream == null) return;

			yield local_stream.close_async(Priority.DEFAULT);

			msg.request_body.free();
			msg.response_body.free();

			if(msg.status_code != Status.OK && msg.status_code != Status.PARTIAL_CONTENT)
			{
				if(msg.status_code == Status.CANCELLED)
				{
					throw new IOError.CANCELLED("Download cancelled by user");
				}

				if(err == null)
					err = new GLib.Error(http_error_quark(), (int) msg.status_code, msg.reason_phrase);

				throw err;
			}
		}

		private async File? await_download(SoupDownload download) throws Error
		{
			File downloaded_file = null;
			Error download_error = null;

			SourceFunc callback = await_download.callback;
			var download_finished_id = download_finished.connect((downloader, downloaded) => {
				if(((SoupDownload) downloaded).remote.get_uri() != download.remote.get_uri()) return;
				downloaded_file = ((SoupDownload) downloaded).local_tmp;
				callback();
			});
			var download_cancelled_id = download_cancelled.connect((downloader, cancelled_download, error) => {
				if(((SoupDownload) cancelled_download).remote.get_uri() != download.remote.get_uri()) return;
				download_error = error;
				callback();
			});
			var download_failed_id = download_failed.connect((downloader, failed_download, error) => {
				if(((SoupDownload) failed_download).remote.get_uri() != download.remote.get_uri()) return;
				download_error = error;
				callback();
			});

			yield;

			disconnect(download_finished_id);
			disconnect(download_cancelled_id);
			disconnect(download_failed_id);

			if(download_error != null) throw download_error;

			return downloaded_file;
		}

		private async void await_queue(SoupDownload download)
		{
			lock(dl_queue)
			{
				if(download.remote.get_uri() in dl_queue) return;
				dl_queue.add(download.remote.get_uri());
			}

			var download_finished_id = download_finished.connect((downloader, downloaded) => {
				lock(dl_queue) dl_queue.remove(((SoupDownload) downloaded).remote.get_uri());
			});
			var download_cancelled_id = download_cancelled.connect((downloader, cancelled_download, error) => {
				lock(dl_queue) dl_queue.remove(((SoupDownload) cancelled_download).remote.get_uri());
			});
			var download_failed_id = download_failed.connect((downloader, failed_download, error) => {
				lock(dl_queue) dl_queue.remove(((SoupDownload) failed_download).remote.get_uri());
			});

			while(dl_queue.peek() != null && dl_queue.peek() != download.remote.get_uri() && !download.is_cancelled)
			{
				download.status = new FileDownload.Status(Download.State.QUEUED);
				yield Utils.sleep_async(2000);
			}

			disconnect(download_finished_id);
			disconnect(download_cancelled_id);
			disconnect(download_failed_id);
		}

		private async void download_from_filesystem(SoupDownload download) throws GLib.Error
		{
			if(download.remote == null || !download.remote.query_exists()) return;
			try
			{
				if(GameHub.Application.log_downloader)
				{
					debug("[SoupDownloader] Copying '%s' to '%s'", download.remote.get_path(), download.local_tmp.get_path());
				}
				yield download.remote.copy_async(
					download.local_tmp,
					FileCopyFlags.OVERWRITE,
					Priority.DEFAULT,
					null,
					(current, total) => { download.status = new FileDownload.Status(Download.State.DOWNLOADING, current, total); });
			}
			catch(IOError.EXISTS error){}
		}
	}

	public class SoupDownload: FileDownload, PausableDownload
	{
		public weak Session? session;
		public weak Message? message;
		public bool is_cancelled = false;

		public SoupDownload(File remote, File local, File local_tmp)
		{
			base(remote, local, local_tmp);
		}

		public void pause()
		{
			if(session != null && message != null && _status.state == Download.State.DOWNLOADING)
			{
				session.pause_message(message);
				_status.state = Download.State.PAUSED;
				status_change(_status);
			}
		}
		public void resume()
		{
			if(session != null && message != null && _status.state == Download.State.PAUSED)
			{
				session.unpause_message(message);
			}
		}
		public override void cancel()
		{
			is_cancelled = true;
			if(session != null && message != null)
			{
				session.cancel_message(message, Soup.Status.CANCELLED);
			}
		}
	}
}
