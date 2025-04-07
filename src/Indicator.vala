/*-
 * Copyright 2015 Wingpanel Developers (http://launchpad.net/wingpanel)
 *           2025 teamcons -- teamcons.github.com
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Library General Public License as published by
 * the Free Software Foundation, either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

 
public class SimpleThings.Indicator : Wingpanel.Indicator {
    private static GLib.Settings settings;
    private Gtk.Entry? entry;
    private Gtk.Label? label;
    private Gtk.Box? box;

    public Indicator () {
        Object (code_name: "simplethings");
    }

    construct {
        Intl.setlocale (LocaleCategory.ALL, "");
        Intl.bindtextdomain (GETTEXT_PACKAGE, LOCALEDIR);
        Intl.bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
        Intl.textdomain (GETTEXT_PACKAGE);

        settings = new GLib.Settings ("io.github.ellie_commons.indicator-simplethings");
        visible = true;
    }

    public override Gtk.Widget get_display_widget () {
        if (label == null) {
            string text = settings.get_string ("text");

            // Avoid having nothing to display
            // And allow translating the default
            if (text == "") {
                text = _("Simple Things!");
            }
            label = new Gtk.Label(text);
        }
        return label;
    }

    public override Gtk.Widget? get_widget () {
        if (box == null) {
            entry = new Gtk.Entry();
            entry.set_text (settings.get_string ("text"));
            entry.vexpand = true;
            entry.hexpand = true;
            entry.height_request = 24;
            entry.placeholder_text = _("Add simple things here :)");

            // Nice clean box to pad it.
            box = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
            box.add (entry);
            box.margin = 6;

        }
        return box;
    }

    public override void opened () {
        entry.grab_focus ();
    }

    public override void closed () {

        // Avoid having nothing to display
        // And allow translating the default
        if (   entry.text == "") {
                entry.text = _("Simple Things!");
        }

        settings.set_string ("text", entry.text);
        label.set_label (settings.get_string ("text"));
    }


}




public Wingpanel.Indicator? get_indicator (Module module, Wingpanel.IndicatorManager.ServerType server_type) {
    debug ("Activating SimpleThings Indicator");

    if (server_type != Wingpanel.IndicatorManager.ServerType.SESSION) {
        return null;
    }

    var indicator = new SimpleThings.Indicator ();
    return indicator;
}