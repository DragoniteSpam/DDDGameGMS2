name="Base Map";
internal_name="BASEMAP";
summary="you can walk around on it and stuff";

tileset=noone;      // the DataTileset object

xx=0;
yy=0;
zz=0;

audio_bgm="";

audio_ambient=ds_list_create();
audio_ambient_frequencies=ds_list_create();

fog_start=256;
fog_end=1024;

indoors=false;
draw_water=true;
fast_travel_to=true;
fast_travel_from=true;

is_3d=true;

// Since maps are basically three-dimensional arrays, the amount of
// space they take up goes up pretty quickly (width*height*depth*the
// size of whatever data's in it). In the future it's probably a
// good idea to only store the active one(s) in memory and load/delete
// them when necessary, or at the very least the data in the "contents"
// structures.
contents=noone;

// it turns out iterating over every element in a 3D structure to draw
// them is unreasonably inefficient, so since most of the slots in the
// 3D structure are probably going to be air anyway we're going to keep
// a (smaller) parallel list of things that actually exist in the map
list_static=noone;
list_dynamic=noone;

// a vertex buffer
statics=vertex_create_buffer();

