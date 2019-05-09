/// @description  boolean bia_apply_sp_attack_raise_1(queue, nullable user, target, nullable DataMove);
/// @param queue
/// @param  nullable user
/// @param  target
/// @param  nullable DataMove

var queue=argument[0];
var user=argument[1];
var target=argument[2];
var move=argument[3];

if (pokemon_can_raise_stat(target, Stats.SPATTACK)){
    be_help_stat_raise(queue, target);
    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, L("%0's Special Attack rose!", target.name)));
    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_stat_set, target, Stats.SPATTACK, target.mods[Stats.SPATTACK]+1));
    return true;
} else {
    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, L("%0's Special Attack won't go any higher!", target.name)));
}

return false;
