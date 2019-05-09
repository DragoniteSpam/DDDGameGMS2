/// @description  BattleExecutableAction add_battle_executable_action(action, user, targets, value);
/// @param action
/// @param  user
/// @param  targets
/// @param  value

with (instance_create(0, 0, BattleExecutableAction)){
    action=argument0;
    user=argument1;
    targets=argument2;
    value=argument3;
    
    return id;
}
