with (Battle){
    switch (stage){
        case BattleStages.BEGIN:
            battle_process_begin();
            break;
        case BattleStages.LOOP:
            battle_process_loop();
            break;
        case BattleStages.END:
            battle_process_end();
            break;
    }
}
