for (var i=0; i<ds_list_size(contestants); i++){
    if (contestants[| i]==noone||!alive(contestants[| i])){
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_check_contestant, i));
    }
}
