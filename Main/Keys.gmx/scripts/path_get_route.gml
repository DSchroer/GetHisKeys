////path_get_route(target)
var target;
target = argument0;

for(var i = 0; i < ds_list_size(list); i++)
{
    ns = ds_list_find_value(list, i);
    with(ns)
    {
        instance_destroy();
    }
}

ds_list_clear(list);

var size;
size = ds_grid_get(grid, target.x / grid_size, target.y / grid_size)

var px, py;
px = (floor(target.x / grid_size) * grid_size) / grid_size;
py = (floor(target.y / grid_size) * grid_size) / grid_size;

for(var val = size; val > 0; val--)
{
    var angle_raw = point_direction(lx, ly, px, py)
    var angle = round(angle_raw / 90) * 90;
    var pos = angle_raw > angle;
    
    for(var stage = 0; stage < 4; stage++)
    {
        if(pos)
        {
            angle = angle + (stage * 90);
        }else{
            angle = angle - (stage * 90);
        }
        
        angle = (((angle % 360) + 360) % 360)
        
        i = 0;
        j = 0;
        switch(angle)
        {
            case 0:
            i = 1;
            break;
            case 90:
            i = -1;
            break;
            case 180:
            j = 1;
            break;
            case 270:
            j = -1;
            break;
        }
        
        var nx, ny;
        nx = px + i;
        ny = py + j;
        if(nx < 0 || nx >= (room_width / grid_size) || ny < 0 || ny >= (room_height / grid_size))
        {
            continue;
        }
        
        if(ds_grid_get(grid,nx,ny) == val)
        {
            px = nx;
            py = ny;
            break;
        }
    }
    
    ds_list_add(list, instance_create(px * grid_size + (grid_size / 2), py * grid_size + (grid_size / 2), obj_point));
}

ds_list_copy(debug_list, list)
return list;
