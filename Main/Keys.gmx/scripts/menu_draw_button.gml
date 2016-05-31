////menu_draw_button(x,y,text,id)
var text_pos = (argument3 * 50) - ((menu_count * 50) / 2);

draw_text(argument0,argument1 + text_pos,argument2)


if(menu_selected == argument3)
{
    var line_pos = (argument3 * 50) - ((menu_count * 50) / 2) + 45;
    var w = string_width(argument2)
    
    var left, right;
    if(halign == fa_center)
    {
        left = -w/2;
        right = w/2;
    }else{
        left = -w;
        right = 0;
    }
    
    draw_line_width(argument0 + left, argument1 + line_pos, argument0 + right,  argument1 + line_pos, 3);
}
