/// @description  void be_confuse(user, target, move id);
/// @param user
/// @param  target
/// @param  move id

with (instance_create(0, 0, BattleAppliedEffect)){
    // todo if you're allowed to confuse
    if (argument1.confused==0){
        bia_apply_confusion(scheduled_actions, argument0, argument1, irandom_range(World.settings.battle.confuse_min_turns, World.settings.battle.confuse_max_turns), get_move(argument2));
        cancel_if_target_fainted=true;
    }
    
    return id;
}
