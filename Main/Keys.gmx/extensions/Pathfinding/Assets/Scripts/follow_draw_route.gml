////follow_draw_route()
if(follow_has_point())
{
    var obj;
    var obj1;
    
    for(var i = 0; i < ds_list_size(route) - 1; i++)
    {
        obj = ds_list_find_value(route, i);
        obj1 = ds_list_find_value(route, i + 1);
        draw_line(obj.x + 16, obj.y + 16, obj1.x + 16, obj1.y + 16);
    }
}
