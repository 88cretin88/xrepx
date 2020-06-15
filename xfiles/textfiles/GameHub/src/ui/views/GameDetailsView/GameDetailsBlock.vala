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

using Gtk;
using GameHub.UI.Widgets;

using Gdk;
using Gee;

using GameHub.Data;

namespace GameHub.UI.Views.GameDetailsView
{
	public abstract class GameDetailsBlock: Box
	{
		public Game game { get; construct; }

		public int text_max_width { get; construct; }

		public abstract bool supports_game { get; }

		protected Box? add_info_label(string title, string? text, bool multiline=true, bool markup=false, Container? parent=null)
		{
			if(text == null || text == "") return null;

			var title_label = Styled.H4Label(title);
			title_label.set_size_request(multiline ? -1 : 128, -1);
			title_label.valign = Align.START;

			var text_label = new Label(text);
			text_label.get_style_context().add_class(multiline ? "gameinfo-multiline-value" : "gameinfo-singleline-value");
			text_label.halign = Align.START;
			text_label.hexpand = false;
			text_label.wrap = true;
			text_label.xalign = 0;
			text_label.max_width_chars = text_max_width;
			text_label.use_markup = markup;

			var box = new Box(multiline ? Orientation.VERTICAL : Orientation.HORIZONTAL, multiline ? 0 : 16);
			box.margin_start = box.margin_end = 8;
			box.add(title_label);
			box.add(text_label);
			(parent ?? this).add(box);

			return box;
		}
	}
}
