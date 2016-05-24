////path_reset(source)
source = argument0;
ds_grid_clear(grid,0);

while(ds_queue_size(queue) > 0)
{
    ns = ds_queue_dequeue(queue);
    with(ns)
    {
        instance_destroy();
    }
}
ds_queue_clear(queue);

lx = (floor(source.x / grid_size) * grid_size) / grid_size;
ly = (floor(source.y / grid_size) * grid_size) / grid_size;

ds_grid_set(grid, lx, ly, 1);
ds_queue_enqueue(queue, instance_create(lx, ly, obj_point));
