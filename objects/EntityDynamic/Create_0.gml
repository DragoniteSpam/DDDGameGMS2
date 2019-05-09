/// @description  entities that can move around

event_inherited();

// not going to worry about load scripts QUITE yet

movement_free=true;     // false when in the process of moving between cells
moving=false;           // you would think this is just !movement_free but it's not

update=update_dynamic_non_player;
update_post=update_dynamic_post;
update_new_cell=update_dynamic_new_cell;

map_direction=Directions.DOWN;
mspd=2;                 // tiles per second

