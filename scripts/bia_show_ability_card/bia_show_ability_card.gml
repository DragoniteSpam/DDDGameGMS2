/// @description  boolean bia_show_ability_card(queue, user);
/// @param queue
/// @param  user

var queue=argument0;
var user=argument1;

// wait time could be a setting but i'm not making it one.
ds_queue_enqueue(queue, add_battle_round_action(battle_round_action_anim_send_in_pokemon_ability, user.position));
ds_queue_enqueue(queue, add_battle_round_action(battle_individual_action_wait, 1.8, true));
ds_queue_enqueue(queue, add_battle_round_action(battle_round_action_anim_retract_pokemon_ability, user.position));

return true;
