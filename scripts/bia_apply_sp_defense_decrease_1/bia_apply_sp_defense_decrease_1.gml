/// @description  boolean bia_apply_sp_defense_decrease_1(queue, nullable user, target, nullable DataMove);
/// @param queue
/// @param  nullable user
/// @param  target
/// @param  nullable DataMove

var queue=argument[0];
var user=argument[1];
var target=argument[2];
var move=argument[3];

if (pokemon_can_lower_stat(target, Stats.SPDEFENSE)){
    be_help_stat_fall(queue, target);
    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, L("%0's Special Defense fell!", target.name)));
    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_stat_set, target, Stats.SPDEFENSE, target.mods[Stats.SPDEFENSE]-1));
    return true;
} else {
    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, L("%0's Special Defense won't go any lower!", target.name)));
}

return false;
