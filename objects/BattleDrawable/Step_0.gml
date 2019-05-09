/// @description  draw me

if (!surface_exists(surface)){
    surface=surface_create(sprite_width, sprite_height);
}

if (surface_get_width(surface)!=sprite_width||surface_get_height(surface)!=sprite_height){
    surface_resize(surface, sprite_width, sprite_height);
}

d3d_end();
d3d_set_hidden(false);

surface_set_target(surface);
draw_clear_alpha(c_black, 0);
draw_sprite_general(sprite_index, floor(image_index), 0, 0, sprite_width, sprite_height,
    0, 0, 1, 1, 0, color, color, color, color, alpha);
script_execute(mask_script);
surface_reset_target();

d3d_start();
d3d_set_hidden(true);

