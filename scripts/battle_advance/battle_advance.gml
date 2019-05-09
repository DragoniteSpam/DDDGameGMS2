with (Battle){
    // if the action queues are empty
    if (!battle_continue()){
        // if there are no things queued up, add some things
        // each of the scripts in this switch tree ought to continue on their own
        switch (stage){
            case BattleStages.BEGIN:
                battle_begin_loop();
                break;
            case BattleStages.LOOP:
                if (Battle.result==BattleStatus.CONTINUE){
                    battle_begin_loop();
                } else {
                    battle_begin_end();
                }
                //battle_begin_end();
                break;
            case BattleStages.END:
                // return to game probably
                break;
        }
    }
}
