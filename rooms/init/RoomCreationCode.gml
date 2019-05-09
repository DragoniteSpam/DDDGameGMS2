// if this goes anywhere throw this behind a loading screen

show_debug_overlay(true);
application_surface_draw_enable(false);
draw_set_alpha_test(true);

/*
 * The physical game window
 */

globalvar W, H, FULLSCREEN;

ini_open(OPTIONS_INI);
set_resolution(ini_read_real("Graphics", "width", 1280), ini_read_real("Graphics", "height", 720), ini_read_real("Graphics", "fullscreen", false));
ini_close();

// end setup

room_goto(the_primary_room_that_the_game_operates_out_of);