////find_area_close_jump(type)


var num = instance_number(argument0);
var close, dist;
close = noone;
dist = -1;
for(var i = 0; i < num; i++)
{
    var test = instance_find(argument0, i);    
    
    if(test.owner_index == noone)
    {
        var d = point_distance(x,y,test.x,test.y);
        if(close = noone)
        {
            close = test;
            dist = d;
        }

        if(d < dist)
        {   
            close = test;
            dist = d;
        }
    }
}

x = close.x;
y = close.y;
nx = x;
ny = y;

owned_area = close;
close.owner_index = self;
movement_target = close;
