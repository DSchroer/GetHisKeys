////follow_update(amount)

if(!instance_exists(followee))
{
    return 0;
}

if((tx != followee.x || ty != followee.y) && position != 0)
{
    tx = followee.x;
    ty = followee.y;
    position = 0;
    path_reset(follower);
    skips = 1;
}

if(!path_has_route(followee))
{
    path_calculate(argument0, followee);
}

if(path_has_route(followee) && (tx != followee.x || ty != followee.y))
{
    var tmp_route;
    tmp_route = path_get_route(followee);
    
    ds_stack_clear(route);
    for(var i = 0; i < ds_list_size(tmp_route); i++)
    {
        ds_stack_push(route, ds_list_find_value(tmp_route,i));
    }
    
    tx = followee.x;
    ty = followee.y;
}
