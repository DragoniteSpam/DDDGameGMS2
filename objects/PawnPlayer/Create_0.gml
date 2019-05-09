event_inherited();

name="Player Pawn";

battle_input_script=battle_input_player;
sentient=true;

overworld_sprite=b_chr_ethan;
battle_sprite=ClassBattleSprites.PLAYERPAWN;

money=500;

// inherited
update=update_player;
deleteable=false;

am_solid=false;             // this will cause problems if you don't snap to grid

