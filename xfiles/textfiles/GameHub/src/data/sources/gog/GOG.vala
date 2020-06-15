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
using GameHub.Data.DB;
using GameHub.Utils;

namespace GameHub.Data.Sources.GOG
{
	public class GOG: GameSource
	{
		private const string CLIENT_ID = "46899977096215655";
		private const string CLIENT_SECRET = "9d85c43b1482497dbbce61f6e4aa173a433796eeae2ca8c5f6129f2dc4de46d9";
		private const string REDIRECT = "https%3A%2F%2Fembed.gog.com%2Fon_login_success%3Forigin%3Dclient";

		private const string[] GAMES_BLACKLIST = {"1424856371" /* Hotline Miami 2: Wrong Number - Digital Comics */};

		public static GOG instance;

		public override string id { get { return "gog"; } }
		public override string name { get { return "GOG"; } }
		public override string icon { get { return "source-gog-symbolic"; } }

		public override bool enabled
		{
			get { return settings.enabled; }
			set { settings.enabled = value; }
		}

		public string? user_id { get; protected set; }
		public string? user_name { get; protected set; }

		private string? user_auth_code = null;
		public string? user_token = null;
		private string? user_refresh_token = null;
		private bool token_needs_refresh = false;

		private Settings.Auth.GOG settings;

		public GOG()
		{
			instance = this;

			settings = Settings.Auth.GOG.instance;
			var access_token = settings.access_token;
			var refresh_token = settings.refresh_token;
			if(access_token.length > 0 && refresh_token.length > 0)
			{
				user_token = access_token;
				user_refresh_token = refresh_token;
				token_needs_refresh = true;
			}
		}

		public override bool is_installed(bool refresh)
		{
			return true;
		}

		public override async bool install()
		{
			return true;
		}

		public override async bool authenticate()
		{
			settings.authenticated = true;

			if(token_needs_refresh && user_refresh_token != null)
			{
				return (yield refresh_token());
			}

			return (yield get_auth_code()) && (yield get_token());
		}

		public override bool is_authenticated()
		{
			return !token_needs_refresh && user_token != null;
		}

		public override bool can_authenticate_automatically()
		{
			return user_refresh_token != null && settings.authenticated;
		}

		private async bool get_auth_code()
		{
			if(user_auth_code != null)
			{
				return true;
			}

			var wnd = new GameHub.UI.Windows.WebAuthWindow(this.name, @"https://auth.gog.com/auth?client_id=$(CLIENT_ID)&redirect_uri=$(REDIRECT)&response_type=code&layout=client2", "https://embed.gog.com/on_login_success?origin=client&code=");

			wnd.finished.connect(code =>
			{
				user_auth_code = code;
				if(GameHub.Application.log_auth)
				{
					debug("[Auth] GOG auth code: %s", code);
				}
				Idle.add(get_auth_code.callback);
			});

			wnd.canceled.connect(() => Idle.add(get_auth_code.callback));

			wnd.set_size_request(550, 680);
			wnd.show_all();
			wnd.present();

			yield;

			return user_auth_code != null;
		}

		private async bool get_token()
		{
			if(user_token != null)
			{
				return true;
			}

			var url = @"https://auth.gog.com/token?client_id=$(CLIENT_ID)&client_secret=$(CLIENT_SECRET)&grant_type=authorization_code&redirect_uri=$(REDIRECT)&code=$(user_auth_code)";
			var root = (yield Parser.parse_remote_json_file_async(url)).get_object();
			user_token = root.get_string_member("access_token");
			user_refresh_token = root.get_string_member("refresh_token");
			user_id = root.get_string_member("user_id");

			settings.access_token = user_token ?? "";
			settings.refresh_token = user_refresh_token ?? "";

			if(GameHub.Application.log_auth)
			{
				debug("[Auth] GOG access token: %s", user_token);
				debug("[Auth] GOG refresh token: %s", user_refresh_token);
				debug("[Auth] GOG user id: %s", user_id);
			}

			return user_token != null;
		}

		public async bool refresh_token()
		{
			if(user_refresh_token == null)
			{
				return false;
			}

			if(GameHub.Application.log_auth)
			{
				debug("[Auth] Refreshing GOG access token with refresh token: %s", user_refresh_token);
			}

			var url = @"https://auth.gog.com/token?client_id=$(CLIENT_ID)&client_secret=$(CLIENT_SECRET)&grant_type=refresh_token&refresh_token=$(user_refresh_token)";
			var root_node = yield Parser.parse_remote_json_file_async(url);
			var root = root_node != null && root_node.get_node_type() == Json.NodeType.OBJECT ? root_node.get_object() : null;

			if(root == null)
			{
				token_needs_refresh = false;
				return false;
			}

			user_token = root.get_string_member("access_token");
			user_refresh_token = root.get_string_member("refresh_token");
			user_id = root.get_string_member("user_id");

			settings.access_token = user_token ?? "";
			settings.refresh_token = user_refresh_token ?? "";

			if(GameHub.Application.log_auth)
			{
				debug("[Auth] GOG access token: %s", user_token);
				debug("[Auth] GOG refresh token: %s", user_refresh_token);
				debug("[Auth] GOG user id: %s", user_id);
			}

			token_needs_refresh = false;

			return user_token != null;
		}

		private HashMap<string, PlayerStatItem> load_player_stats()
		{
			var player_stats = new HashMap<string, PlayerStatItem>();

			if(user_name == null)
			{
				var userdata_node = Parser.parse_remote_json_file(@"https://embed.gog.com/userData.json", "GET", user_token);
				var userdata = userdata_node != null && userdata_node.get_node_type() == Json.NodeType.OBJECT ? userdata_node.get_object() : null;
				user_name = userdata != null && userdata.has_member("username") ? userdata.get_string_member("username") : null;
			}

			if(user_name == null) return player_stats;

			var page = 1;
			var pages = 1;

			while(page <= pages)
			{
				var url = @"https://embed.gog.com/u/$(user_name)/games/stats?sort=total_playtime&order=desc&page=$(page)";
				var root_node = Parser.parse_remote_json_file(url, "GET", user_token);
				var root = root_node != null && root_node.get_node_type() == Json.NodeType.OBJECT ? root_node.get_object() : null;

				if(root == null) break;

				page = (int) root.get_int_member("page");
				pages = (int) root.get_int_member("pages");

				debug("[GOG] Loading player stats: page %d of %d", page, pages);

				var items = root.get_object_member("_embedded").get_array_member("items");

				foreach(var i in items.get_elements())
				{
					var game = Parser.json_object(i, {"game"});
					var stats = Parser.json_object(i, {"stats", user_id});
					if(game == null || !game.has_member("id")) continue;
					var id = game.get_string_member("id");
					var image = game.has_member("image") ? game.get_string_member("image") : null;
					var playtime = stats != null && stats.has_member("playtime") ? stats.get_int_member("playtime") : 0;
					int64 last_launch = 0;

					#if GLIB_2_56
					if(stats != null && stats.has_member("lastSession"))
					{
						last_launch = new DateTime.from_iso8601(stats.get_string_member("lastSession"), new TimeZone.utc()).to_unix();
					}
					#endif

					player_stats.set(id, new PlayerStatItem(id, playtime, last_launch, image));
				}

				page++;
			}

			return player_stats;
		}

		private ArrayList<Game> _games = new ArrayList<Game>(Game.is_equal);

		public override ArrayList<Game> games { get { return _games; } }

		public override async ArrayList<Game> load_games(Utils.FutureResult2<Game, bool>? game_loaded=null, Utils.Future? cache_loaded=null)
		{
			if(((user_id == null || user_token == null) && token_needs_refresh) || _games.size > 0)
			{
				return _games;
			}

			Utils.thread("GOGLoading", () => {
				_games.clear();

				var stats = load_player_stats();

				var cached = Tables.Games.get_all(this);
				games_count = 0;
				if(cached.size > 0)
				{
					foreach(var g in cached)
					{
						if(!(g.id in GAMES_BLACKLIST))
						{
							if(stats.has_key(g.id))
							{
								var s = stats.get(g.id);
								g.last_launch = int64.max(g.last_launch, s.last_launch);
								g.playtime_source = s.playtime;
							}
							if(!Settings.UI.Behavior.instance.merge_games || !Tables.Merges.is_game_merged(g))
							{
								_games.add(g);
								if(game_loaded != null)
								{
									game_loaded(g, true);
								}
							}
						}
						games_count++;
					}
				}

				if(cache_loaded != null)
				{
					cache_loaded();
				}

				var page = 1;
				var pages = 1;

				while(page <= pages)
				{
					var url = @"https://embed.gog.com/account/getFilteredProducts?mediaType=1&page=$(page)";
					var root_node = Parser.parse_remote_json_file(url, "GET", user_token);
					var root = root_node != null && root_node.get_node_type() == Json.NodeType.OBJECT ? root_node.get_object() : null;

					if(root == null) break;

					page = (int) root.get_int_member("page");
					pages = (int) root.get_int_member("totalPages");

					debug("[GOG] Loading games: page %d of %d", page, pages);

					if(page == 1)
					{
						var tags = root.has_member("tags") ? root.get_array_member("tags") : null;
						if(tags != null)
						{
							foreach(var t in tags.get_elements())
							{
								var id = t.get_object().get_string_member("id");
								var name = t.get_object().get_string_member("name");
								Tables.Tags.add(new Tables.Tags.Tag("gog:" + id, name, icon));
								if(GameHub.Application.log_verbose)
								{
									debug("[GOG] Imported tag: %s (%s)", name, id);
								}
							}
						}
					}

					var products = root.get_array_member("products");

					foreach(var g in products.get_elements())
					{
						var game = new GOGGame(this, g);
						bool is_new_game = !(game.id in GAMES_BLACKLIST) && !_games.contains(game);
						if(is_new_game)
						{
							if(stats.has_key(game.id))
							{
								var s = stats.get(game.id);
								game.last_launch = int64.max(game.last_launch, s.last_launch);
								game.playtime_source = s.playtime;
							}
							if(!Settings.UI.Behavior.instance.merge_games || !Tables.Merges.is_game_merged(game))
							{
								_games.add(game);
								if(game_loaded != null)
								{
									game_loaded(game, false);
								}
							}
						}

						var g_index = _games.index_of(game);
						if(g_index >= 0 && g_index < _games.size)
						{
							var go = g.get_object();
							((GOGGame) _games.get(g_index)).has_updates = go.has_member("updates") && go.get_int_member("updates") > 0;
						}

						if(is_new_game)
						{
							games_count++;
							game.save();
						}
					}

					page++;
				}

				Idle.add(load_games.callback);
			});

			yield;

			return _games;
		}

		private class PlayerStatItem
		{
			public string id;
			public int64  playtime;
			public int64  last_launch;
			public string image;

			public PlayerStatItem(string id, int64 playtime, int64 last_launch, string image)
			{
				this.id = id;
				this.playtime = playtime;
				this.last_launch = last_launch;
				this.image = image;
			}
		}
	}
}
