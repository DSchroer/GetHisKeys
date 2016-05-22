////scr_find_area(type)
var num = instance_number(argument0);
var rand = random(num);
for(var i = 0; i < num; i++)
{
    var test = instance_find(argument0, (i + rand) % num);    
    owned_area = test;
    if(test.owner_index == noone)
    {
        test.owner_index = self;
        movement_target = test;
        break;
    }
}
