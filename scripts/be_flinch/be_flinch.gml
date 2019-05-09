/// @description  void be_flinch(user, target, move id);
/// @param user
/// @param  target
/// @param  move id

with (instance_create(0, 0, BattleAppliedEffect)){
    bia_apply_flinch(scheduled_actions, argument0, argument1, get_move(argument2));
    // you don't really need to do this, because if the target faints the
    // effect just won't do anything, but I guess it can't hurt.
    cancel_if_target_fainted=true;
    
    return id;
}
