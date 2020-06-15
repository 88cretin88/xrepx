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

namespace GameHub.Utils
{
	public class Parser
	{
		private static Session? session = null;

		public static string load_file(string path, string file="")
		{
			var f = FSUtils.file(path, file);
			if(!f.query_exists()) return "";
			string data;
			try
			{
				FileUtils.get_contents(f.get_path(), out data);
			}
			catch(Error e)
			{
				warning(e.message);
			}
			return data;
		}

		private static Message? prepare_message(string url, string method="GET", string? auth=null, HashMap<string, string>? headers=null, HashMap<string, string>? data=null)
		{
			if(session == null)
			{
				session = new Session();
				session.timeout = 5;
				session.max_conns = 256;
				session.max_conns_per_host = 256;
			}

			var message = new Message(method, url);

			if(auth != null)
			{
				message.request_headers.append("Authorization", "Bearer " + auth);
			}

			if(headers != null)
			{
				foreach(var header in headers.entries)
				{
					message.request_headers.append(header.key, header.value);
				}
			}

			if(data != null)
			{
				var multipart = new Multipart("multipart/form-data");
				foreach(var v in data.entries)
				{
					multipart.append_form_string(v.key, v.value);
				}
				multipart.to_message(message.request_headers, message.request_body);
			}

			return message;
		}

		public static string load_remote_file(string url, string method="GET", string? auth=null, HashMap<string, string>? headers=null, HashMap<string, string>? data=null, out uint status=null)
		{
			var message = prepare_message(url, method, auth, headers, data);

			status = session.send_message(message);
			return (string) message.response_body.data;
		}

		public static async string load_remote_file_async(string url, string method="GET", string? auth=null, HashMap<string, string>? headers=null, HashMap<string, string>? data=null, out uint status=null)
		{
			uint status_code = 0;
			var result = "";
			var message = prepare_message(url, method, auth, headers, data);

			session.queue_message(message, (s, m) => {
				status_code = m.status_code;
				result = (string) m.response_body.data;
				load_remote_file_async.callback();
			});
			yield;
			status = status_code;
			return result;
		}

		public static Json.Node parse_json(string? json)
		{
			if(json == null || json.length == 0) return new Json.Node(Json.NodeType.NULL);
			try
			{
				var parser = new Json.Parser();
				parser.load_from_data(json);
				return parser.get_root();
			}
			catch(GLib.Error e)
			{
				warning(e.message);
			}
			return new Json.Node(Json.NodeType.NULL);
		}

		public static Json.Node parse_vdf(string vdf)
		{
			return parse_json(vdf_to_json(vdf));
		}

		public static Json.Node parse_json_file(string path, string file="")
		{
			return parse_json(load_file(path, file));
		}

		public static Json.Node parse_vdf_file(string path, string file="")
		{
			return parse_vdf(load_file(path, file));
		}

		public static Json.Node parse_remote_json_file(string url, string method="GET", string? auth=null, HashMap<string, string>? headers=null, HashMap<string, string>? data=null, out uint status=null)
		{
			return parse_json(load_remote_file(url, method, auth, headers, data, out status));
		}

		public static Json.Node parse_remote_vdf_file(string url, string method="GET", string? auth=null, HashMap<string, string>? headers=null, HashMap<string, string>? data=null, out uint status=null)
		{
			return parse_vdf(load_remote_file(url, method, auth, headers, data, out status));
		}

		public static async Json.Node parse_remote_json_file_async(string url, string method="GET", string? auth=null, HashMap<string, string>? headers=null, HashMap<string, string>? data=null, out uint status=null)
		{
			return parse_json(yield load_remote_file_async(url, method, auth, headers, data, out status));
		}

		public static async Json.Node parse_remote_vdf_file_async(string url, string method="GET", string? auth=null, HashMap<string, string>? headers=null, HashMap<string, string>? data=null, out uint status=null)
		{
			return parse_vdf(yield load_remote_file_async(url, method, auth, headers, data, out status));
		}

		public static Json.Object? json_object(Json.Node? root, string[] keys)
		{
			if(root == null || root.get_node_type() != Json.NodeType.OBJECT) return null;
			return json_nested_object(root.get_object(), keys);
		}

		public static Json.Object? json_nested_object(Json.Object? root, string[] keys)
		{
			if(root == null) return null;
			Json.Object? obj = root;

			foreach(var key in keys)
			{
				if(obj != null && obj.has_member(key))
				{
					var member = obj.get_member(key);
					if(member != null && member.get_node_type() == Json.NodeType.OBJECT)
					{
						obj = member.get_object();
					}
					else obj = null;
				}
				else obj = null;

				if(obj == null) break;
			}

			return obj;
		}

		private static string vdf_to_json(string vdf_data)
		{
			var json = vdf_data;

			try
			{
				var nl_commas = new Regex("(\"|\\})(\\s*?\\r?\\n\\s*?\")");
				var semicolons = new Regex("\"(\\s*?\\r?\\n?\\s*?(?:\"|\\{))");

				json = nl_commas.replace(json, json.length, 0, "\\g<1>,\\g<2>");
				json = semicolons.replace(json, json.length, 0, "\":\\g<1>");
			}
			catch(Error e)
			{
				warning(e.message);
			}

			return "{" + json + "}";
		}

		public static unowned Xml.Doc* parse_xml(string? xml)
		{
			if(xml == null || xml.length == 0) return null;
			return Xml.Parser.parse_doc(xml);
		}

		public static unowned Html.Doc* parse_html(string? html, string url)
		{
			if(html == null || html.length == 0) return null;
			return Html.Doc.read_doc(html, url, null, Html.ParserOption.NOERROR | Html.ParserOption.NOWARNING | Html.ParserOption.RECOVER | Html.ParserOption.NONET);
		}

		public static Html.Node* html_node(Html.Node* root, string[] tags)
		{
			if(root == null) return null;
			var obj = root;

			foreach(var tag in tags)
			{
				if(obj != null)
				{
					obj = html_subnode(obj, tag);
				}
				else obj = null;

				if(obj == null) break;
			}

			return obj;
		}

		public static Xml.Node* xml_subnode(Xml.Node* root, string name)
		{
			for(var iter = root->children; iter != null; iter = iter->next)
			{
				if(iter->type == Xml.ElementType.ELEMENT_NODE)
				{
					if(iter->name == name)
					{
						return (Xml.Node*) iter;
					}
				}
			}
			return null;
		}

		public static Html.Node* html_subnode(Xml.Node* root, string name)
		{
			return (Html.Node*) xml_subnode(root, name);
		}

		public static Xml.Doc* parse_xml_file(string path, string file="")
		{
			return parse_xml(load_file(path, file));
		}

		public static Xml.Doc* parse_remote_xml_file(string url, string method="GET", string? auth=null, HashMap<string, string>? headers=null, HashMap<string, string>? data=null)
		{
			return parse_xml(load_remote_file(url, method, auth, headers, data));
		}

		public static async Xml.Doc* parse_remote_xml_file_async(string url, string method="GET", string? auth=null, HashMap<string, string>? headers=null, HashMap<string, string>? data=null)
		{
			return parse_xml(yield load_remote_file_async(url, method, auth, headers, data));
		}

		public static Html.Doc* parse_html_file(string path, string file="")
		{
			return parse_html(load_file(path, file), "file://" + path);
		}

		public static Html.Doc* parse_remote_html_file(string url, string method="GET", string? auth=null, HashMap<string, string>? headers=null, HashMap<string, string>? data=null)
		{
			return parse_html(load_remote_file(url, method, auth, headers, data), url);
		}

		public static async Html.Doc* parse_remote_html_file_async(string url, string method="GET", string? auth=null, HashMap<string, string>? headers=null, HashMap<string, string>? data=null)
		{
			return parse_html(yield load_remote_file_async(url, method, auth, headers, data), url);
		}

		public static string xml_node_to_string(Xml.Node* node)
		{
			var buf = new Xml.Buffer();
			buf.node_dump(node->doc, node, 0, 1);
			return buf.content();
		}

		public delegate void JsonBulderDelegate(Json.Builder builder);
		public static Json.Node json(JsonBulderDelegate? d=null)
		{
			var builder = new Json.Builder();
			builder.begin_object();
			if(d != null)
			{
				d(builder);
			}
			builder.end_object();
			return builder.get_root();
		}
	}
}
