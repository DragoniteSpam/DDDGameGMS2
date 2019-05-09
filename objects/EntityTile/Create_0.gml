event_inherited();

name="Tile";

load_script=load_entity_tile;

tile_x=0; // tile ID
tile_y=0; // tile ID
tile_color=c_white;
tile_alpha=1;
// todo rotated tiles, which will require normal calculations?
// you're probably better off using a mesh for that though tbh

// if you want to be really fancy you can use different colors for
// all four vertices of the tile but I can't think of any practical
// use for that

batch=batch_tile;
am_solid=false;
contents_adder=contents_add_single;
contents_remover=contents_remove_single;

