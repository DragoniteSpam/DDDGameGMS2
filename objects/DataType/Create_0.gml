event_inherited();

name="Base Type";
pbs_internal_name="BASETYPE";

special=false;
color=c_yellow;

// this is how much damage THIS type deals to each OTHER type
on=null;

/// misc constants

// if you modify the pbs, remember to modify this otherwise you're not going to have a fun time.

enum Types {
    NORMAL,
    FIGHTING,
    FLYING,
    POISON,
    GROUND,
    ROCK,
    BUG,
    GHOST,
    STEEL,
    QMARKS,
    FIRE,
    WATER,
    GRASS,
    ELECTRIC,
    PSYCHIC,
    ICE,
    DRAGON,
    DARK,
//    FAIRY,    // vanilla pbs does not have this data so we'll leave it out
}

