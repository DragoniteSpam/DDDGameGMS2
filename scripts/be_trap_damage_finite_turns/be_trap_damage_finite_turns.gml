/// @description  void be_trap_damage_finite_turns(user, target, move id);
/// @param user
/// @param  target
/// @param  move id

with (instance_create(0, 0, BattleAppliedEffect)){
    if (argument1.trapped_by==-1){
        argument1.trapped_by=argument0.position;
        argument1.trapped_for=World.settings.battle.trap_finite_turns;
        argument1.trapped_residual_damage=World.settings.battle.trapped_residual_damage;
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, L("%0 was trapped by %1's %2!", argument1.name, argument0.name, get_move(argument2).name)));
        cancel_if_target_fainted=true;
    }
    
    return id;
}
