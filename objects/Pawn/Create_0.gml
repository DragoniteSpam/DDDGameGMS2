/// @description  constants and stuff

// i'd prefer that these are sort of in the same order as
// the unit circle (right, up, left, down) but i alsow want
// maximum compatibility with RPG Maker - so please don't
// turn these into angles (0 90 180 270) like you did that
// one time

enum Directions {
    DOWN,
    LEFT,
    RIGHT,
    UP
}

event_inherited();

load_script=load_entity_pawn;

name="AI Pawn";
team=noone;

// this is NOT your trainer class. the trainer class can be found in
// get_trainer(trainer_index).class
trainer_index=0;
trainer_id=irandom((1<<16)-1);
party=ds_list_create();

battle_input_script=battle_input_ai;
sentient=false;

// This is a sprite that's (supposed to) get set based on
// the result of
// get_class_battle_sprite(get_trainer_class(get_trainer(trainer_id).class).battle_sprite),
// etc
battle_sprite=spr_ethan_back;
overworld_sprite=b_chr_silver;

audio_battle=bgm_silence;
audio_victory=bgm_silence;
audio_intro=bgm_silence;

// inherited
render=render_pawn;
contents_adder=contents_add_single;
contents_remover=contents_remove_single;

frame=0;

