/// @description  void be_user_attack_raise_1(user, target, move id);
/// @param user
/// @param  target
/// @param  move id
// this activates instantly upon being processed, it does not
// get queued!
// update: i don't know what the above comment is talking about.
// it gets queued. sort of.

var target=argument1;

with (instance_create(0, 0, BattleAppliedEffect)){
    bia_apply_attack_raise_1(scheduled_actions, argument0, argument0, get_move(argument2));
    
    return id;
}
