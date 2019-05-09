/// @description  void be_double_power_if_diving(user, target, move id);
/// @param user
/// @param  target
/// @param  move id

var user=argument0;     // unused here
var target=argument1;   // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (argument1.invulnerable_state==InvulnerableStates.UNDERWATER){
        // double damage and always hits
        damage_modifier=2;
        accuracy_base=1;
    }
    
    return id;
}
