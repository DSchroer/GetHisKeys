////map_draw()
if(!surface_exists(lightSurface))
{
    lightSurface = surface_create(view_wport, view_hport);
}

var l;
l = ds_map_find_value(instance_find(obj_light_var,0).map_layer,string(layer));

for(i = 0; i < ds_list_size(l); i++)
{

    var obj;
    obj = ds_list_find_value(l, i);
    
    if(!obj.in_view)
    {
        continue;
    }
    
    with(obj)
    {
        if(self.layer == other.layer)
        {
            if(!surface_exists(self.redraw))
            {
                self.redraw = surface_create(l_width, l_height);
                self.rendered = false;
            }
            
            if(!self.rendered || self.collision || self.dynamic)
            {
                core_caster();
                core_distance();
                core_reductions();
                core_shadow();
                core_postprocess();
                self.rendered = true;
            }
             
           
        }
    }
}
   

surface_set_target(lightSurface);
draw_clear(self.color);

for(i = 0; i < ds_list_size(l); i++)
{
    var obj;
    obj = ds_list_find_value(l, i);
    
    if(!obj.in_view)
    {
        continue;
    }

    with(obj)
    {
        if(self.layer == other.layer)
        {
            draw_set_blend_mode( bm_add );
            draw_surface_ext(self.redraw,(self.x-view_xview) * view_wport / view_wview,(self.y-view_yview) * view_wport / view_wview,self.scale * view_wport / view_wview,self.scale * view_wport / view_wview,0,c_white,1.0);
        }
    }
}

surface_reset_target();

surface_set_target(application_surface);

shader_set(sdr_blend_shadow);
draw_set_blend_mode_ext( bm_dest_color, bm_src_color );
draw_surface_ext(lightSurface,0,0, 1,1,0,c_white,1)
draw_set_blend_mode( bm_normal );
shader_reset();

surface_reset_target()

draw_set_blend_mode( bm_normal );
