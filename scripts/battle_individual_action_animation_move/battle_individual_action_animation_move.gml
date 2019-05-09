/// @description  void battle_individual_action_animation_move(BattleIndividualAction);
/// @param BattleIndividualAction
// 0: user
// 1: targets
// 2: move (object)

var params=argument0;

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    user=params[| 0];
    target_list=params[| 1];
    script=params[| 2].animation;
    misc_data[? "color"]=params[| 2].animation_blending_color;
}
