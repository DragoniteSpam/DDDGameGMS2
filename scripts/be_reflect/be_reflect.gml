/// @description  void be_reflect(user, target, move);
/// @param user
/// @param  target
/// @param  move

var target=argument1;   // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (argument0.owner.team.double_stat[Stats.DEFENSE]==0){
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, L("%0's team Defense increased!", argument0.owner.team.name)));
        argument0.owner.team.double_stat[Stats.DEFENSE]=World.settings.battle.damage_filter_turns;
    }
    
    return id;
}
