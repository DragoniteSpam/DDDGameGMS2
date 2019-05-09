/// @description  void battle_round_action_anim_send_in_pokemon_ability(params);
/// @param params
// 0: contestant index

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    var draw=Battle.drawables[| argument0[| 0]];
    // remember we need to attach a pokémon to the battle hud at some point
    draw.hud_ability.user=Battle.contestants[| argument0[| 0]];
    
    user=draw.hud_ability;
    user.x=user.offscreen_x;
    user.y=user.offscreen_y;
    script=ba_send_in_pokemon_hud;
}
