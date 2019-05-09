/// @description  void battle_round_action_anim_trainer_intro(params);
/// @param params
// 0: team index

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    user=Battle.drawables[| argument0[| 0]];
    user.alpha=1;
    user.x=user.battle_x;
    user.y=user.battle_y;
    user.z=user.battle_z;
    script=ba_trainer_intro;
}
