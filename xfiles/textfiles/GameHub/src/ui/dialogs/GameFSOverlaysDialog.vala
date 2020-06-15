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
using Gdk;
using Gee;


using GameHub.Data;
using GameHub.Data.DB;
using GameHub.Utils;
using GameHub.UI.Widgets;

namespace GameHub.UI.Dialogs
{
	public class GameFSOverlaysDialog: Dialog
	{
		private const int RESPONSE_ENABLE_OVERLAYS = 1;

		public Game? game { get; construct; }

		private Stack stack;

		private Box disabled_box;
		private AlertView disabled_alert;
		private Button enable_btn;

		private Box content;
		private ListBox overlays_list;
		private ScrolledWindow overlays_scrolled;

		private Entry id_entry;
		private Entry name_entry;
		private Button add_btn;

		public GameFSOverlaysDialog(Game? game)
		{
			Object(transient_for: Windows.MainWindow.instance, resizable: false, title: _("%s: Overlays").printf(game.name), game: game);
		}

		construct
		{
			get_style_context().add_class("rounded");
			get_style_context().add_class(Gtk.STYLE_CLASS_FLAT);

			gravity = Gdk.Gravity.NORTH;

			stack = new Stack();
			stack.transition_type = StackTransitionType.CROSSFADE;

			content = new Box(Orientation.VERTICAL, 0);
			content.margin_start = content.margin_end = 6;

			disabled_box = new Box(Orientation.VERTICAL, 0);

			disabled_alert = new AlertView(_("Overlays are disabled"), _("Enable overlays to manage DLCs and mods\n\nEnabling will move game to the “base“ overlay"), "dialog-information");
			disabled_alert.get_style_context().remove_class(Gtk.STYLE_CLASS_VIEW);
			disabled_alert.halign = Align.START;

			disabled_box.add(disabled_alert);

			var overlays_header = Styled.H4Label(_("Overlays"));
			overlays_header.xpad = 8;
			content.add(overlays_header);

			overlays_list = new ListBox();
			overlays_list.get_style_context().add_class("overlays-list");
			overlays_list.selection_mode = SelectionMode.NONE;

			overlays_scrolled = new ScrolledWindow(null, null);
			overlays_scrolled.vexpand = true;
			#if GTK_3_22
			overlays_scrolled.propagate_natural_width = true;
			overlays_scrolled.propagate_natural_height = true;
			overlays_scrolled.max_content_height = 320;
			#endif
			overlays_scrolled.add(overlays_list);

			content.add(overlays_scrolled);

			var separator = new Separator(Orientation.HORIZONTAL);
			separator.margin_bottom = 8;
			content.add(separator);

			var add_box = new Box(Orientation.HORIZONTAL, 0);
			add_box.get_style_context().add_class(Gtk.STYLE_CLASS_LINKED);

			id_entry = new Entry();
			id_entry.hexpand = true;
			id_entry.placeholder_text = _("Overlay ID (directory name)");
			id_entry.primary_icon_name = "list-add-symbolic";

			name_entry = new Entry();
			name_entry.hexpand = true;
			name_entry.placeholder_text = _("Overlay name (optional)");

			add_btn = new Button.with_label(_("Add"));
			add_btn.sensitive = false;

			add_box.add(id_entry);
			add_box.add(name_entry);
			add_box.add(add_btn);

			content.add(add_box);

			stack.add(disabled_box);
			stack.add(content);

			get_content_area().add(stack);
			get_content_area().set_size_request(480, 240);

			enable_btn = add_button(_("Enable overlays"), RESPONSE_ENABLE_OVERLAYS) as Button;
			enable_btn.get_style_context().add_class(Gtk.STYLE_CLASS_SUGGESTED_ACTION);
			enable_btn.grab_default();

			response.connect((source, response_id) => {
				switch(response_id)
				{
					case RESPONSE_ENABLE_OVERLAYS:
						game.enable_overlays();
						break;
				}
			});

			destroy.connect(() => {
				game.save_overlays();
				game.mount_overlays.begin();
			});

			show_all();

			game.notify["overlays-enabled"].connect(update);

			add_btn.clicked.connect(add_overlay);

			id_entry.activate.connect(() => name_entry.grab_focus());
			name_entry.activate.connect(add_overlay);

			id_entry.changed.connect(() => add_btn.sensitive = id_entry.text.strip().length > 0);

			Idle.add(() => {
				update();
				return Source.REMOVE;
			});
		}

		private void update()
		{
			game.load_overlays();

			if(!game.overlays_enabled)
			{
				disabled_box.foreach(w => {
					if(w != disabled_alert)
					{
						w.destroy();
					}
				});

				if(game.install_dir != null && game.install_dir.query_exists())
				{
					var safety = FSOverlay.RootPathSafety.for(game.install_dir);

					if(safety != FSOverlay.RootPathSafety.SAFE)
					{
						var message_type = MessageType.WARNING;
						var message = _("Overlay usage at this path may be unsafe\nProceed at your own risk\n\nPath: <b>%s</b>");

						if(safety == FSOverlay.RootPathSafety.RESTRICTED)
						{
							message_type = MessageType.ERROR;
							message = _("Overlay usage at this path is not supported\n\nPath: <b>%s</b>");
						}

						var label = new Label(message.printf(game.install_dir.get_path()));
						label.use_markup = true;

						var msg = new InfoBar();
						msg.get_style_context().add_class(Gtk.STYLE_CLASS_FRAME);
						msg.get_content_area().add(label);
						msg.message_type = message_type;
						msg.show_all();
						disabled_box.add(msg);
					}

					enable_btn.sensitive = safety != FSOverlay.RootPathSafety.RESTRICTED;
				}
				else
				{
					enable_btn.sensitive = false;
				}

				stack.visible_child = disabled_box;
				enable_btn.visible = true;
			}
			else
			{
				stack.visible_child = content;
				enable_btn.visible = false;
				enable_btn.sensitive = false;

				overlays_list.foreach(w => w.destroy());

				foreach(var overlay in game.overlays)
				{
					overlays_list.add(new OverlayRow(overlay));
				}

				overlays_list.show_all();
			}
		}

		private void add_overlay()
		{
			var id = id_entry.text.strip();
			var name = name_entry.text.strip();
			if(name.length == 0) name = id;
			if(id.length == 0) return;
			game.overlays.add(new Game.Overlay(game, id, name, true));
			game.save_overlays();
			id_entry.text = name_entry.text = "";
			id_entry.grab_focus();
		}

		private class OverlayRow: ListBoxRow
		{
			public Game.Overlay overlay { get; construct; }

			public OverlayRow(Game.Overlay overlay)
			{
				Object(overlay: overlay);
			}

			construct
			{
				var grid = new Grid();
				grid.margin_start = grid.margin_end = 8;
				grid.margin_top = grid.margin_bottom = 6;
				grid.column_spacing = 8;

				var name = new Label(overlay.name);
				name.get_style_context().add_class("category-label");
				name.hexpand = true;
				name.xalign = 0;

				var id = new Label(overlay.id);
				id.hexpand = true;
				id.xalign = 0;

				var open = new Button.from_icon_name("folder-symbolic", IconSize.SMALL_TOOLBAR);
				open.tooltip_text = _("Open directory");
				open.valign = Align.CENTER;
				open.get_style_context().add_class(Gtk.STYLE_CLASS_FLAT);

				var remove = new Button.from_icon_name("edit-delete-symbolic", IconSize.SMALL_TOOLBAR);
				remove.tooltip_text = _("Remove overlay");
				remove.sensitive = overlay.removable;
				remove.valign = Align.CENTER;
				remove.get_style_context().add_class(Gtk.STYLE_CLASS_FLAT);

				var enabled = new Switch();
				enabled.active = overlay.enabled;
				enabled.sensitive = overlay.id != Game.Overlay.BASE;
				enabled.valign = Align.CENTER;

				grid.attach(name, 0, 0);
				grid.attach(id, 0, 1);
				grid.attach(open, 1, 0, 1, 2);
				grid.attach(remove, 2, 0, 1, 2);
				grid.attach(enabled, 3, 0, 1, 2);

				child = grid;

				open.clicked.connect(() => {
					Utils.open_uri(overlay.directory.get_uri());
				});

				remove.clicked.connect(() => {
					overlay.remove();
				});

				enabled.notify["active"].connect(() => {
					overlay.enabled = enabled.active;
					overlay.game.save_overlays();
				});
			}
		}
	}
}
