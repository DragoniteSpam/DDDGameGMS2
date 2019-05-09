/// @description  void battle_round_action_anim_send_in_pokemon_hud(params);
/// @param params
// 0: contestant index

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    var team=Battle.teams[| argument0[| 0]];
    var draw=Battle.drawables[| argument0[| 0]];
    // remember we need to attach a pokémon to the battle hud at some point
    draw.hud.user=Battle.contestants[| argument0[| 0]];
    
    user=draw.hud;
    user.x=user.offscreen_x;
    user.y=user.offscreen_y;
    script=ba_send_in_pokemon_hud;
}
