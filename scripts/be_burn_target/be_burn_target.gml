/// @description  void be_burn_target(user, target, move id);
/// @param user
/// @param  target
/// @param  move id

with (instance_create(0, 0, BattleAppliedEffect)){
    bia_apply_major_status(scheduled_actions, argument0, argument1, MajorStatus.BURN, 1, get_move(argument2));
    cancel_if_target_fainted=true;
    
    return id;
}
