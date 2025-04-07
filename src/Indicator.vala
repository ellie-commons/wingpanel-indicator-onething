/*-
 * Copyright 2015 Wingpanel Developers (http://launchpad.net/wingpanel)
 *           2022 lenemter <lenemter@gmail.com>
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
    private Gtk.Entry entry;
    private Gtk.Label label;
    private Gtk.Box popover;

    public Indicator () {
        Object (code_name: "simplethings");

        settings = new GLib.Settings ("io.github.ellie_commons.indicator-simplethings");
        visible = true;


    }

    public override Gtk.Widget get_display_widget () {
        if (label == null) {
            label = new Gtk.Label(settings.get_string ("text"));
        }
        return label;
    }

    public override Gtk.Widget? get_widget () {
        if (popover == null) {
            entry.set_text ("likuhdv") ; //settings.get_string ("text");
            entry.show();

            popover = new Gtk.Box(Gtk.Orientation.HORIZONTAL,0);
            popover.add (entry);
        }
        return popover;
    }

    public override void opened () {
        entry.text = settings.get_string ("text");
    }

    public override void closed () {
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