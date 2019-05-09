/// @description  void BattleDrawable.bg_draw_drawable();

// the surface is drawn in BattleDrawable.Step
// being in 3D mode sort of breaks surfaces, and targeting surfaces
// sort of breaks 3D mode, and that took me all day to figure out
// so you'd better appreciate it

transform_set(0, 0, 0, 90, 0, 0, 1, 1, 1);
// None of my sprites are the same size because why would they be,
// so we have to scale them up and scale them back down to make sure
// that they look like they're the same size
transform_add(x, y, z, 0, 0, 0, scale*0.5, scale*0.5, scale*0.5);

draw_surface_ext(surface, -sprite_get_xoffset(sprite_index)*xscale, -sprite_get_yoffset(sprite_index)*yscale, xscale, yscale, rotation, c_white, 1);

transform_reset();
