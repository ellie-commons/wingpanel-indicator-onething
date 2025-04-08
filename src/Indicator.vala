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
            text = check_text (text);
            label = new Gtk.Label(text);
        }
        return label;
    }

    public override Gtk.Widget? get_widget () {
        if (box == null) {
            entry = new Gtk.Entry();
            entry.hexpand = true;

            // You will never see it in gtk3
            entry.placeholder_text = _("Add simple things here :)");

            switch (settings.get_int ("position")) {
                case 0: entry.set_alignment(0.0f);break;
                case 1: entry.set_alignment(0.5f);break;
                case 2: entry.set_alignment(1f);break;
            }

            // Nice clean box to pad it.
            box = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
            box.add (entry);
            box.margin = 6;
        }
        return box;
    }

    public override void opened () {
        entry.set_text (label.get_text ());
        entry.grab_focus ();
    }

    public override void closed () {
        string text = check_text (entry.text);
        label.set_label (text);
        settings.set_string ("text", text);
    }


    // Avoid having nothing to display
    // And allow translating the default
    private string check_text(string entered_text) {

        if (entered_text == "") {
            entered_text = _("Simple Things!");
        }
        return entered_text;
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
