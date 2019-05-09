/// @description  void battle_individual_action_exp_gain(BattleIndividualAction);
/// @param BattleIndividualAction
// 0: user
// 1: initial exp
// 2: exp gained

var params=argument0;

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    user=params[| 0];
    // this is to avoid imprecision that may occur while scrolling
    misc_data[? "current"]=params[| 1];
    misc_data[? "gain"]=params[| 2];
    script=ba_exp_gain;
}
