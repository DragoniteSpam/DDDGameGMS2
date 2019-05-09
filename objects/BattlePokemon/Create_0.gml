species=0;
name="";
owner=noone;    // the Pawn (this should ONLY be used in battle)
trainer=noone;  // the DataTrainer

act=array_compose(50, 20, 20, 20, 20, 20)

act_hp=50;

mods=array_compose(0, 0, 0, 0, 0, 0, 0, 0);

moves=array_create(MOVE_LIMIT);
move_pp=array_create(MOVE_LIMIT);
move_pp_up=array_create(MOVE_LIMIT);
for (var i=0; i<MOVE_LIMIT; i++){
    moves[i]=noone;
    move_pp[i]=0;
    move_pp_up[i]=0;
}

previous_moves=ds_list_create();

gender=Genders.MALE;
status=MajorStatus.NONE;
status_turns=0;
item=-1;
form=0;

// the ability is a DataAbility, not an index 0..size of
// base ability list, because a pokémon's ability can be changed
// during battle (Simple, etc)
ability=noone;
// this is the one that goes 0..size of base ability index
default_ability=0;

experience=1;

evs=array_compose(0, 0, 0, 0, 0, 0);
ivs=array_compose(irandom(1<<5-1), irandom(1<<5-1), irandom(1<<5-1),
    irandom(1<<5-1), irandom(1<<5-1), irandom(1<<5-1));

// there are a few cases in which your individual types can be modified
// in battle (but they're not very common)
types=ds_list_clone(get_pokemon(species).types);

// todo this
nature=0;

// battle stuff: resets on switch out, but can persist with Baton Pass

position=-1;

invulnerable_state=InvulnerableStates.NONE; // affects damage calculations for a few moves
invulnerable_move=-1;                       // the move being used (Fly and Bounce both result in Airborne and you may want to differentiate between them)
momentum_move=-1;                           // Rollout of Ice Ball, or whatever it's called
momentum_turn=0;                            // turn of Rollout or Ice Ball
trapped_by=-1;                              // the pokémon trapping you
trapped_for=0;                              // how much longer you can be trapped (can be an arbitrarily big number for 'infinite')
trapped_residual_damage=0;                     // how much damage you take at the end of each turn; if you want, this can be accompanied by a type if you want typed damage
// if/when you add more to this list REMEMBER TO MIRROR THE CHANGES
// IN pokemon_reset_volatile_stat_mods UNLESS YOU WANT IT TO PERSIST AFTER YOU SWITCH OUT.

// battle stuff: resets when the battle ends

// todo this needs to increase or decrease at the end of every turn,
// depending on how it's going to be used
status_turn=0;                              // how much damage you take from Toxic poison, how much longer you will be asleep
// if/when you add more to this list REMEMBER TO MIRROR THE CHANGES
// IN pokemon_reset_battle_stat_mods UNLESS YOU WANT IT TO PERSIST BETWEEN FIGHTS.

// volatile status (pokemon_reset_volatile_stat_mods)
confused=0;
flinch=false;
turn_count=0;
last_move=-1;

// this is so that the game can know that you've fainted before it executes the action that
// makes you faint, i.e. to keep fainted pokémon from executing moves or beint targeted by other moves
flag_downed=false;
fired_entry_ability=false;

// control animations on me
animate_on=false;

// some more things
shadow=false;
ball_type=0;
shiny=false;

spr_front=noone;
spr_back=noone;

/// constants and stuff

// these are in this specific order because that's the order of the
// icons in spr_major_status, which is a terrible reason, but the
// alternative is mapping a lot of values onto other values
enum MajorStatus {
    SLEEP,
    POISON,
    BURN,
    PARALYZE,
    FREEZE,
    FAINT,
    POKERUS,
    TOXIC,
    NONE,
}

enum Stats {
    HP,
    ATTACK,
    DEFENSE,
    SPATTACK,
    SPDEFENSE,
    SPEED,
    ACCURACY,
    EVADE,
}

enum InvulnerableStates {
    NONE,
    UNDERWATER,
    UNDERGROUND,
    AIRBORNE,
}

