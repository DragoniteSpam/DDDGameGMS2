/// @description  void bi_action_full_restore(queue, user, item);
/// @param queue
/// @param  user
/// @param  item

ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_text, L("%0 used a(n) %1 on %2!", argument1.owner.name, get_item(argument2).name, argument1.name)));
if (argument1.confused>0){
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_set_confusion, argument1, 0));
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_text, L("%0 snapped out of confusion!", argument1.name)));
}
// save this because we need to still talk about it after it's been healed
var status=argument1.status;
ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_set_major_status, argument1, MajorStatus.NONE));
var amount=argument1.act[Stats.HP]-argument1.act_hp;
if (amount>0){
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_scroll_health, argument1, -amount));
    var text;
    if (argument1.owner==Camera.following){
        if (amount==1){
            text=L("%0's health was restored by %1 point!", argument1.name, amount);
        } else {
            text=L("%0's health was restored by %1 points!", argument1.name, amount);
        }
    } else {
        text=L("%0's health was restored!", argument1.name);
    }
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_text, text));
}
if (status!=MajorStatus.NONE){
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_text, L("%0's %1 was cured!", argument1.name, string_lower(World.major_status_things[status]))));
}

pawn_remove_item(argument1.owner, argument2, 1);
