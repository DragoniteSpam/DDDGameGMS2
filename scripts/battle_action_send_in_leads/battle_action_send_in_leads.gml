for (var i=0; i<ds_list_size(teams); i++){
    ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_anim_trainer_intro, i));
    ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_anim_retract_trainer, i));
    ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_submit_leads, i));
    ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_anim_send_in_pokemon_walking, i));
    ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_anim_send_in_pokemon_hud, i));
    // todo in multi battles, non-lead pokémon should be
    // sent in via poké ball
}
