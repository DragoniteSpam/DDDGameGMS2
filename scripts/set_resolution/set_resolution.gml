/// @description  void set_resolution(width, height, fullscreen);
/// @param width
/// @param  height
/// @param  fullscreen

W=argument0;
H=argument1;
FULLSCREEN=argument2;

window_set_size(W, H);
surface_resize(application_surface, W, H);
window_set_fullscreen(FULLSCREEN);
