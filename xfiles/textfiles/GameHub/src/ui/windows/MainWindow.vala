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
using GameHub.UI.Views;
using GameHub.Settings;

namespace GameHub.UI.Windows
{
	public class MainWindow: Gtk.ApplicationWindow
	{
		public static MainWindow instance;

		private SavedState.Window saved_state;

		public HeaderBar titlebar;
		private Stack stack;

		public MainWindow(GameHub.Application app)
		{
			Object(application: app);
			instance = this;
		}

		construct
		{
			title = "GameHub";

			titlebar = new HeaderBar();
			titlebar.title = title;
			titlebar.show_close_button = true;
			titlebar.has_subtitle = false;

			set_titlebar(titlebar);

			set_default_size(1108, 720);
			set_size_request(640, 520);

			var vbox = new Box(Orientation.VERTICAL, 0);

			stack = new Stack();
			stack.transition_type = StackTransitionType.CROSSFADE;
			stack.notify["visible-child"].connect(stack_updated);

			add_view(new WelcomeView());

			vbox.add(stack);

			add(vbox);

			notify["has-toplevel-focus"].connect(() => {
				current_view.on_window_focus();
			});

			saved_state = SavedState.Window.instance;

			delete_event.connect(() => { quit(); return false; });

			restore_saved_state();
		}

		public void add_view(BaseView view, bool show=true)
		{
			view.attach_to_window(this);
			stack.add(view);
			if(show)
			{
				stack.set_visible_child(view);
				view.show();
			}
			stack_updated();
		}

		private void stack_updated()
		{
			current_view.on_show();
		}

		private void restore_saved_state()
		{
			if(saved_state.width > -1)
				default_width = saved_state.width;
			if(saved_state.height > -1)
				default_height = saved_state.height;

			switch(saved_state.state)
			{
				case SavedState.Window.State.MAXIMIZED:
					maximize();
					break;
				case SavedState.Window.State.FULLSCREEN:
					fullscreen();
					break;
				default:
					if(saved_state.x > -1 && saved_state.y > -1)
						move(saved_state.x, saved_state.y);
					break;
			}
		}

		private void update_saved_state()
		{
			var state = get_window().get_state();
			if(Gdk.WindowState.MAXIMIZED in state)
			{
				saved_state.state = SavedState.Window.State.MAXIMIZED;
			}
			else if(Gdk.WindowState.FULLSCREEN in state)
			{
				saved_state.state = SavedState.Window.State.FULLSCREEN;
			}
			else
			{
				saved_state.state = SavedState.Window.State.NORMAL;

				int width, height;
				get_size(out width, out height);
				saved_state.width = width;
				saved_state.height = height;
			}

			int x, y;
			get_position(out x, out y);
			saved_state.x = x;
			saved_state.y = y;
		}

		private void quit()
		{
			update_saved_state();
		}

		public BaseView current_view
		{
			get
			{
				return stack.visible_child as BaseView;
			}
		}
	}
}
