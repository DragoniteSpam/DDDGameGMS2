/// @description  void draw_rectangle_9s(sprite, x, y, width, height);
/// @param sprite
/// @param  x
/// @param  y
/// @param  width
/// @param  height

var sw=sprite_get_width(argument0)/3;
var sh=sprite_get_height(argument0)/3;

draw_sprite_part(argument0, 0, 0, 0, sw, sh, argument1, argument2);
draw_sprite_part(argument0, 0, 2*sw, 0, sw, sh, argument1+argument3-sw, argument2);
draw_sprite_part(argument0, 0, 2*sw, 2*sh, sw, sh, argument1+argument3-sw, argument2+argument4-sh);
draw_sprite_part(argument0, 0, 0, 2*sh, sw, sh, argument1, argument2+argument4-sh);

var hxscale=(argument3-2*sw)/sw;
var vyscale=(argument4-2*sh)/sh;

draw_sprite_general(argument0, 0, sw, 0, sw, sh, argument1+sw, argument2, hxscale, 1, 0, c_white, c_white, c_white, c_white, 1);
draw_sprite_general(argument0, 0, sw, sh*2, sw, sh, argument1+sw, argument2+argument4-sh, hxscale, 1, 0, c_white, c_white, c_white, c_white, 1);

draw_sprite_general(argument0, 0, 0, sh, sw, sh, argument1, argument2+sh, 1, vyscale, 0, c_white, c_white, c_white, c_white, 1);
draw_sprite_general(argument0, 0, 2*sw, sh, sw, sh, argument1+argument3-sw, argument2+sh, 1, vyscale, 0, c_white, c_white, c_white, c_white, 1);

draw_sprite_general(argument0, 0, sw, sh, sw, sh, argument1+sw, argument2+sh, hxscale, vyscale, 0, c_white, c_white, c_white, c_white, 1);
