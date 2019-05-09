// todo support for alpha fades that dont go 0..1?
// todo support for blend modes?

draw_set_alpha(alpha);
draw_rectangle_colour(0, 0, W, H, color, color, color, color, false);
draw_set_alpha(1);

t=t+World.dt;
