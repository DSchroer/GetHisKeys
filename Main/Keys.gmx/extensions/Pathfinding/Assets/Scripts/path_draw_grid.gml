////path_draw_grid()
draw_set_color(c_white);
for(var i = 0; i < ceil(room_width / grid_size); i++)
{
    for(var j = 0; j < ceil(room_height / grid_size); j++)
    {
        draw_text(i * 32, j * 32, string(ds_grid_get(grid, i, j)));
    }
}
draw_set_color(c_white);
