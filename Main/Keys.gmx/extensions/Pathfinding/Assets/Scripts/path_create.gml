   ////path_create(source, grid_size)
source = argument0;
grid_size = argument1;

list = ds_list_create();
queue = ds_queue_create();
grid = ds_grid_create(ceil(room_width / grid_size), ceil(room_height / grid_size));

var lx, ly;
lx = source.x * (1.0 / grid_size);
ly = source.y * (1.0 / grid_size);

ds_grid_set(grid, lx, ly, 1);
ds_queue_enqueue(queue, instance_create(lx, ly, obj_point));

