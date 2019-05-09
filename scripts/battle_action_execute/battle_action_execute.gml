while (!ds_priority_empty(priority)){
    ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_execute, ds_priority_delete_max(priority)));
}
