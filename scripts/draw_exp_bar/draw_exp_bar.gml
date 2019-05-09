/// @description  void draw_exp_bar(x, y, x2, y2, f);
/// @param x
/// @param  y
/// @param  x2
/// @param  y2
/// @param  f

draw_rectangle_colour(argument0, argument1, argument2, argument3, c_white, c_white, c_white, c_white, false);
draw_rectangle_colour(argument0, argument1, argument0+(argument2-argument0)*argument4, argument3, c_exp, c_exp, c_exp, c_exp, false);

var w=3;
draw_line_width_colour(argument0, argument1, argument2, argument1, w, c_black, c_black);
draw_line_width_colour(argument0, argument3, argument2, argument3, w, c_black, c_black);
draw_line_width_colour(argument0, argument1, argument0, argument3, w, c_black, c_black);
draw_line_width_colour(argument2, argument1, argument2, argument3, w, c_black, c_black);
