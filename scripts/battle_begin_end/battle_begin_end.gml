stage=BattleStages.END;

ds_queue_enqueue(actions, battle_action_conclude);

battle_advance();
