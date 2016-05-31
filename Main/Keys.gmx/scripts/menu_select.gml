////menu_select(value, relative)
if(argument1)
{
    menu_selected = min(max(menu_selected + argument0, 0),menu_count - 1);
}else{
    menu_selected = min(max(argument0, 0),menu_count - 1);
}

 


