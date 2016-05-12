////follow_create(from,to)
follower = argument0;
followee = argument1;

path_create(follower, 32);
route = ds_stack_create();

position = 0;
tx = -1;
ty = -1;
