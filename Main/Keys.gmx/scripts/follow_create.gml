////follow_create(from,to,size)
follower = argument0;
followee = argument1;
size = argument2;

path_create(follower, size);
route = ds_stack_create();

position = 0;
tx = -1;
ty = -1;
