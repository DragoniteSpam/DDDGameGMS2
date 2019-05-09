// If you want to make this fancier you can use some kind of
// tile/texture instead (see bm_stat_change). I don't really
// want to do that so I'm just going to use a solid color.
draw_set_alpha(misc_data[? "mask alpha"]);
draw_set_colour(c_white);
draw_rectangle(0, 0, sprite_width, sprite_height, false);

draw_set_blend_mode(bm_subtract);
draw_set_color(c_black);
draw_set_alpha(1);

draw_rectangle(0, 0, sprite_width, sprite_height, false);

draw_set_blend_mode(bm_add);
draw_sprite_general(sprite_index, floor(image_index), 0, 0, sprite_width, sprite_height,
    0, 0, 1, 1, 0, c_black, c_black, c_black, c_black, 1);
draw_set_blend_mode(bm_normal);
