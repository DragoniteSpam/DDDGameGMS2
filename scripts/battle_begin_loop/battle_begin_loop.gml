stage=BattleStages.LOOP;

ds_queue_enqueue(actions, battle_action_check_contestants);
ds_queue_enqueue(actions, battle_action_check_replacements_before_turn);
ds_queue_enqueue(actions, battle_action_fire_entry_abilities);
ds_queue_enqueue(actions, battle_action_input);
ds_queue_enqueue(actions, battle_action_execute);
ds_queue_enqueue(actions, battle_action_post_round);
ds_queue_enqueue(actions, battle_action_evaluate);

battle_advance();
