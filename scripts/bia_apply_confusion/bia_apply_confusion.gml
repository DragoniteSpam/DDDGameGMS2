/// @description  boolean bia_apply_confusion(queue, nullable user, target, turns, nullable DataMove, [message]);
/// @param queue
/// @param  nullable user
/// @param  target
/// @param  turns
/// @param  nullable DataMove
/// @param  [message]
// [message] is pretty much only here so you can add 'due to the fatigue'
// to Outrage, etc

var queue=argument[0];
var user=argument[1];
var target=argument[2];
var turns=argument[3];
var move=argument[4];
if (argument_count>5){
    var text=argument[5];
} else {
    var text=L("%0 became confused!", target.name);
}

if (pokemon_can_confuse(target)){
    switch (target.ability.minor_status_acceptance){
        case StatusAcceptance.YES:
            ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_set_confusion, target, turns));
            ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, text));
            return true;
        case StatusAcceptance.MIRROR:
            ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_set_confusion, target, turns));
            ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, text));
            if (user!=noone&&move!=noone&&pokemon_can_confuse(target)){
                bia_show_ability_card(queue, user);
                ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_set_confusion, user, turns));
                ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, L("%0 was confused by %1's %2!", user.name, target.name, target.ability.name)));
            }
            return true;
        case StatusAcceptance.BOUNCE:
            if (user!=noone&&move!=noone&&move.category==MoveCategories.STATUS){
                bia_show_ability_card(queue, target);
                if (pokemon_can_confuse(user)){
                    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_set_confusion, user, turns));
                    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, L("%0 was confused by %1's %2 instead!", user.name, target.name, target.ability.name)));
                }
            } else {
                ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_set_confusion, target, turns));
                ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, text));
                return true;
            }
            break;
    }
}

return false;
