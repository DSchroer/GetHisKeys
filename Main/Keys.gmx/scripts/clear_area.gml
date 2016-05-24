////clear_area()

if(movement_target != noone && object_is_ancestor(movement_target.object_index, obj_area))
{
    movement_target.owner_index = noone;
}

