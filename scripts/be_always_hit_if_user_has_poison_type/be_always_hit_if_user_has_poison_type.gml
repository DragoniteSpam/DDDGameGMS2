/// @description  void be_always_hit_if_user_has_poison_type(user, target, move id);
/// @param user
/// @param  target
/// @param  move id

var tagret=argument1;   // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (World.settings.battle.battle_gen>=BattleGenerations.SIX){
        if (has_type(argument0, Types.POISON)){
            accuracy_base=1;
        }
    }
    
    return id;
}
