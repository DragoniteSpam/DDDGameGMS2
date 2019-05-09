/// @description  void battle_individual_action_death(BattleIndividualAction);
/// @param BattleIndividualAction
// 0: target

var params=argument0;

Battle.input_ready=false;
battle_remove_entrapments(params[| 0]);
with (instance_create(0, 0, BattleAnimator)){
    user=Battle.drawables[| params[| 0].position];
    script=ba_death;
}
