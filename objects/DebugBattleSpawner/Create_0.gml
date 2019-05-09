instance_create(0, 0, Battle);

(get_trainer_class(get_trainer_class_from_name("PLAYERPAWN", true))).battle_sprite=ClassBattleSprites.PLAYERPAWN;
(get_trainer_class(get_trainer_class_from_name("PAWN_RIVAL", true))).battle_sprite=ClassBattleSprites.PAWN_RIVAL;

var pawn_player=pawn_create("PLAYERPAWN", "Bilbo Baggins", 0, 0, 0, 1, Pawn);
//var pawn_ai=pawn_create('PAWN_RIVAL', 'Silver');
var pawn_ai=pawn_create("PAWN_RIVAL", "Silver", 0, 0, 1, 1, Pawn);

Camera.following=pawn_player;

var MIDPOINT=BATTLEFIELD_SIZE/2;
var dist=BATTLEFIELD_SIZE/4;
var dir=240;
var trans_distance=60;
var fade_time=0.05;
var offx=W;
var offy=H-UI_TEXT_BOX_HEIGHT-UI_BATTLE_HUD_HEIGHT-UI_BATTLE_HUD_BUFFER_Y;
var aoffx=-UI_BATTLE_HUD_WIDTH;
var aoffy=offy;
var team=battle_add_team(pawn_player, SpriteSides.BACK);

// you could add a team multiple times if you want to set up a double battle or something, but only create
// it once or youre going to have problems
ds_list_add(Battle.teams, team);
ds_list_add(Battle.contestants, noone);
ds_list_add(Battle.drawables, battle_add_position(pawn_player, MIDPOINT+dist*dcos(dir), MIDPOINT-dist*dsin(dir), 90, trans_distance, fade_time, offx, offy, aoffx, aoffy));
ds_list_add(Battle.replacements, noone);

dir=60;
trans_distance=36;
fade_time=0.5;
offx=-UI_BATTLE_HUD_WIDTH;
offy=UI_BATTLE_HUD_HEIGHT/2+64;  // you can fit half of one between the actual top of the box and the top of the screen
aoffx=W;
aoffy=offy;
team=battle_add_team(pawn_ai, SpriteSides.FRONT);

ds_list_add(Battle.teams, team);
ds_list_add(Battle.contestants, noone);
ds_list_add(Battle.drawables, battle_add_position(pawn_ai, MIDPOINT+dist*dcos(dir), MIDPOINT-dist*dsin(dir), 270, trans_distance, fade_time, offx, offy, aoffx, aoffy));
ds_list_add(Battle.replacements, noone);

with (Battle){
    battle_begin();
}

instance_destroy(/*self*/);

/* */
/*  */
