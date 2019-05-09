/// @description  boolean bia_apply_flinch(queue, nullable user, target, nullable DataMove);
/// @param queue
/// @param  nullable user
/// @param  target
/// @param  nullable DataMove

var queue=argument0;
var user=argument1;
var target=argument2;
var move=argument3;

if (pokemon_can_flinch(target)){
    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_set_flinch, target));
}

return false;
