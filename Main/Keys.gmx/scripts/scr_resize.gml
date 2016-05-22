
if(!debug_mode)
{
    cur_width = max(1, display_get_width());
    cur_height = max(1, display_get_height());
}else{
    cur_width = max(1, window_get_width());
    cur_height = max(1, window_get_height());
}

show_debug_message(cur_width)

var ratio = cur_width / cur_height;

view_wview[0] = self.min_width;
view_hview[0] = self.min_width / ratio;

view_wport[0] = cur_width;
view_hport[0] = cur_height;

surface_resize(application_surface, view_wport[0], view_hport[0]);
display_set_gui_size( view_wport[0], view_hport[0])
