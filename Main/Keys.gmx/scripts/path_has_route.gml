////path_has_route(target)
var target;
target = argument0;
return ds_grid_get(grid, target.x / grid_size, target.y / grid_size) != 0;
