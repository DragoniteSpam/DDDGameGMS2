// juju adams you are a god:
// https://www.reddit.com/r/gamemaker/comments/3aqpx5/surface_alpha_mask_help/csfp0sv

draw_sprite_tiled_ext(misc_data[? "mask sprite"], 0, misc_data[? "mask x"], misc_data[? "mask y"], 1, 1, c_white, misc_data[? "mask alpha"]);

draw_set_blend_mode(bm_subtract);
draw_set_color(c_black);
draw_set_alpha(1);

draw_rectangle(0, 0, sprite_width, sprite_height, false);

draw_set_blend_mode(bm_add);
draw_sprite_general(sprite_index, floor(image_index), 0, 0, sprite_width, sprite_height,
    0, 0, 1, 1, 0, c_black, c_black, c_black, c_black, 1);
draw_set_blend_mode(bm_normal);
