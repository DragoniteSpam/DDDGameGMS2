/*
 * if you want the order of events to go like
 *
 * 1. you trap damage
 * 2. foe trap damage
 * 3. you poison damage
 * 4. foe poison damage
 *
 * then you'll have to separate the for loops. in this case it doesn't
 * really matter because if you both die to post-round effects it's going
 * to be counted as a draw regardless of the order that it happens in,
 * but i don't remember if that's how the rules of actual pokémon go.
 */

// trapping moves (whirlpool, fire spin, etc)
for (var i=0; i<ds_list_size(contestants); i++){
    if (contestants[| i]!=noone&&alive(contestants[| i])){
        // anything that can get silently reset
        contestants[| i].flinch=false;
        contestants[| i].turn_count++;
        
        // anything that the player ought to be informed about
        var contestant=contestants[| i];
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_post_trap_damage, i));
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_post_major_status_damage, i));
        script_execute(contestant.ability.on_round_end, round_actions, contestants[| i], contestants[| i].ability);
        if (contestant.item!=-1){
            script_execute(get_item(contestant.item).battle_hold_post_turn, round_actions, contestant, contestant.item);
        }
    }
}
