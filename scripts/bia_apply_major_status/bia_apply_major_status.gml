/// @description  boolean bia_apply_major_status(queue, nullable user, target, status, status turn, nullable DataMove);
/// @param queue
/// @param  nullable user
/// @param  target
/// @param  status
/// @param  status turn
/// @param  nullable DataMove
// So you don't have to write the code that checks for Synchronize
// and Magic Bounce and all that other stuff every time you want to
// apply a major status.

// You shouldn't use this to apply "no status," because it'll look for
// text to display on the screen to communicate this, but there won't
// be any text, so the game will crash.

var queue=argument0;
var user=argument1;
var target=argument2;
var status=argument3;
var status_turn=argument4;
var move=argument5;

// If you call this from one of the contact ability scripts, or something
// of that nature, remember to reverse the 'user' and 'target' arguments.

// todo each status should have an animation to go with it.

// by the way, 2/3 of this script is choosing the text to display
// based on status. Sorry about that. I had an array of status verbs earlier
// but it was really ugly and I started to get worried that it wouldn't
// work well with translateable text.
// Maybe you could make a script similar to choose_gender but that will
// probably give you the same problem as you had with the array of verbs.

if (pokemon_can_have_status(target, status)){
    switch (target.ability.status_acceptance[status]){
        case StatusAcceptance.YES:
            ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_set_major_status, target, status, status_turn));
            var text;
            switch (status){
                case MajorStatus.POISON:
                    text=L("%0 was poisoned!", target.name);
                    break;
                case MajorStatus.TOXIC:
                    text=L("%0 was badly poisoned!", target.name);
                    break;
                case MajorStatus.BURN:
                    text=L("%0 was burned!", target.name);
                    break;
                case MajorStatus.FREEZE:
                    text=L("%0 was frozen!", target.name);
                    break;
                case MajorStatus.SLEEP:
                    text=L("%0 fell asleep!", target.name);
                    break;
                case MajorStatus.PARALYZE:
                    text=L("%0 was paralyzed!", target.name);
                    break;
            }
            ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, text));
            return true;
        case StatusAcceptance.MIRROR:
            ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_set_major_status, target, status, status_turn));
            var text;
            switch (status){
                case MajorStatus.POISON:
                    text=L("%0 was poisoned!", target.name);
                    break;
                case MajorStatus.TOXIC:
                    text=L("%0 was badly poisoned!", target.name);
                    break;
                case MajorStatus.BURN:
                    text=L("%0 was burned!", target.name);
                    break;
                case MajorStatus.FREEZE:
                    text=L("%0 was frozen!", target.name);
                    break;
                case MajorStatus.SLEEP:
                    text=L("%0 fell asleep!", target.name);
                    break;
                case MajorStatus.PARALYZE:
                    text=L("%0 was paralyzed!", target.name);
                    break;
            }
            ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, text));
            if (user!=noone&&move!=noone&&pokemon_can_have_status(user, status)){
                bia_show_ability_card(queue, target);
                ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_set_major_status, user, status, status_turn));
                switch (status){
                    case MajorStatus.POISON:
                        text=L("%0 was poisoned by %1's %2!", user.name, target.name, target.ability.name);
                        break;
                    case MajorStatus.TOXIC:
                        text=L("%0 was badly poisoned by %1's %2!", user.name, target.name, target.ability.name);
                        break;
                    case MajorStatus.BURN:
                        text=L("%0 was burned by %1's %2!", user.name, target.name, target.ability.name);
                        break;
                    case MajorStatus.FREEZE:
                        text=L("%0 was frozen by %1's %2!", user.name, target.name, target.ability.name);
                        break;
                    case MajorStatus.SLEEP:
                        text=L("%0 fell asleep by %1's %2!", user.name, target.name, target.ability.name);
                        break;
                    case MajorStatus.PARALYZE:
                        text=L("%0 was paralyzed by %1's %2!", user.name, target.name, target.ability.name);
                        break;
                }
                ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, text));
            }
            return true;
        case StatusAcceptance.BOUNCE:
            // Items, Abilities and non-status moves can't trigger Magic Bounce
            // if a move is not null, the user also has to not be null because moves can't be used by
            // nobody
            if (move!=noone&&move!=noone&&move.category==MoveCategories.STATUS){
                bia_show_ability_card(queue, target);
                // i don't remember if magic bounce kicks in if the user is immune to the status they're
                // trying to inflict. if you want that to happen, move the 'can have status' check to the
                // outer check.
                if (pokemon_can_have_status(user, status)){
                    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_set_major_status, user, status, status_turn));
                    var text;
                    switch (status){
                        case MajorStatus.POISON:
                            text=L("%0 was poisoned by %1's %2 instead!", user.name, target.name, target.ability.name);
                            break;
                        case MajorStatus.TOXIC:
                            text=L("%0 was badly poisoned by %1's %2 instead!", user.name, target.name, target.ability.name);
                            break;
                        case MajorStatus.BURN:
                            text=L("%0 was burned by %1's %2 instead!", user.name, target.name, target.ability.name);
                            break;
                        case MajorStatus.FREEZE:
                            text=L("%0 was frozen by %1's %2 instead!", user.name, target.name, target.ability.name);
                            break;
                        case MajorStatus.SLEEP:
                            text=L("%0 fell asleep by %1's %2 instead!", user.name, target.name, target.ability.name);
                            break;
                        case MajorStatus.PARALYZE:
                            text=L("%0 was paralyzed by %1's %2 instead!", user.name, target.name, target.ability.name);
                            break;
                    }
                    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, text));
                }
            } else {
                ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_set_major_status, target, status, status_turn));
                var text;
                switch (status){
                    case MajorStatus.POISON:
                        text=L("%0 was poisoned!", target.name);
                        break;
                    case MajorStatus.TOXIC:
                        text=L("%0 was badly poisoned!", target.name);
                        break;
                    case MajorStatus.BURN:
                        text=L("%0 was burned!", target.name);
                        break;
                    case MajorStatus.FREEZE:
                        text=L("%0 was frozen!", target.name);
                        break;
                    case MajorStatus.SLEEP:
                        text=L("%0 fell asleep!", target.name);
                        break;
                    case MajorStatus.PARALYZE:
                        text=L("%0 was paralyzed!", target.name);
                        break;
                }
                ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, text));
                return true;
            }
            break;
    }
}

return false;
