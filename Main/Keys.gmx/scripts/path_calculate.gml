////path_calculate(steps, target)
var counter, i, j, target;
counter = 0;
target = argument1;

while(ds_queue_size(queue) > 0 && counter++ <= argument0)
{
    if(ds_grid_get(grid, target.x / grid_size, target.y / grid_size) != 0)
    {
        break;
    }
    point = ds_queue_dequeue(queue);
    
    var col = collision_point(point.x * grid_size + (grid_size/2), point.y * grid_size + (grid_size/2), obj_path_wall, true, true);
    if(col != noone && col.dynamic)
    {
        ds_queue_enqueue(queue,point);
        continue;
    }
    
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
    
        np = instance_create(point.x + i, point.y + j, obj_point);
        if(np.x < 0 || np.x >= (room_width / grid_size) || np.y < 0 || np.y >= (room_height / grid_size))
        {
            with(np)
            {
                instance_destroy();
            }
            continue;
        }
        
        if(ds_grid_get(grid,np.x, np.y) != 0)
        {
            with(np)
            {
                instance_destroy();
            }
            continue;
        }
        
        var col = collision_point(np.x * grid_size + (grid_size/2), np.y * grid_size + (grid_size/2), obj_path_wall, true, true);
        if(col != noone)
        {
            if(col.dynamic)
            {
                ds_queue_enqueue(queue,np);
            }else{
                with(np)
                {
                    instance_destroy();
                }
            }
            continue;
        }
        
        ds_grid_set(grid,np.x, np.y, ds_grid_get(grid, point.x, point.y) + 1);
        ds_queue_enqueue(queue,np);
    }
    
    with(point)
    {
        instance_destroy();
    }
}
