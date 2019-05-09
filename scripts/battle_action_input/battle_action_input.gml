for (var i=0; i<ds_list_size(contestants); i++){
    if (alive(contestants[| i])){
        /*
         * other conditions that may block action selection:
         *   - outrage
         */
        var pkmn=contestants[| i];
        if (pkmn.momentum_turn>0){
            var valid_targets=battle_get_valid_targets(pkmn, pkmn.momentum_move);
            var targets=ds_list_create();
            ds_list_add(targets, random_element_from_list(valid_targets));
            ds_list_destroy(valid_targets);
            battle_prioritize(add_battle_executable_action(BattleActions.MOVE, pkmn, targets, pkmn.momentum_move));
        } else {
            ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_input, i));
        }
    }
}
