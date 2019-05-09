/// @description  void battle_round_action_anim_retract_contestant(params);
/// @param params
// 0: drawable index

Battle.input_ready=false;
pokemon_reset_volatile_stat_mods(Battle.contestants[| argument0[| 0]]);
with (instance_create(0, 0, BattleAnimator)){
    user=Battle.drawables[| argument0[| 0]];
    user.alpha=1;
    user.x=user.battle_x;
    user.y=user.battle_y;
    user.z=user.battle_z;
    script=ba_retract_contestant;
}
