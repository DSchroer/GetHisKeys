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
px = target.x / grid_size;
py = target.y / grid_size;

for(var val = size; val > 0; val--)
{
    for(var stage = 0; stage < 4; stage++)
    {
        i = 0;
        j = 0;
        switch(stage)
        {
            case 0:
            i = 1;
            break;
            case 1:
            i = -1;
            break;
            case 2:
            j = 1;
            break;
            case 3:
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
            stage = 4;
        }
    }
    
    ds_list_add(list, instance_create(px * grid_size, py * grid_size, obj_point));
}

return list;
