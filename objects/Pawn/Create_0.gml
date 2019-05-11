/// @description  constants and stuff

// i'd prefer that these are sort of in the same order as
// the unit circle (right, up, left, down) but i also want
// maximum compatibility with RPG Maker - so please don't
// turn these into angles (0 90 180 270) like you did that
// one time where everything broke

enum Directions {
    DOWN,
    LEFT,
    RIGHT,
    UP
}

event_inherited();

load_script=load_entity_pawn;

name="Pawn";
team=noone;

// battle parameteres
sentient=false;

// inherited
render=render_pawn;
contents_adder=contents_add_single;
contents_remover=contents_remove_single;

frame=0;

