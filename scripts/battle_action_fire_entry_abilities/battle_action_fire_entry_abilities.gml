// An attempt to resolve "race conditions" that would arise when
// everyone on the field switches at the same time.

for (var i=0; i<ds_list_size(contestants); i++){
    if (contestants[| i]!=noone&&!contestants[| i].fired_entry_ability){
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_entry_abilities, i));
        contestants[| i].fired_entry_ability=true;
    }
}
