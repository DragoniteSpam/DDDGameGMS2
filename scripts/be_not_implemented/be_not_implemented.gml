/// @description  void be_not_implemented(user, target, move id);
/// @param user
/// @param  target
/// @param  move id

var user=argument0;     // unused here
var target=argument1;   // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, L("(%0 has an effect that has not been implemented yet.)", get_move(argument2).name)));
    
    return id;
}
