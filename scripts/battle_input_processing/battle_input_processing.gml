switch (Battle.input_stage){
    case BattleInputStages.GRAND:
        battle_input_processing_grand();
        break;
    case BattleInputStages.MOVE:
        battle_input_processing_move();
        break;
    case BattleInputStages.ITEM:
        battle_input_processing_item();
        break;
    case BattleInputStages.ITEM_INTERNAL:
        battle_input_processing_item_internal(Battle.view_item_pocket);
        break;
    case BattleInputStages.ITEM_POKEMON:
        battle_input_processing_switch(battle_input_processing_control_switch_item);
        break;
    case BattleInputStages.SWITCH:
        battle_input_processing_switch(battle_input_processing_control_switch_normal);
        break;
    case BattleInputStages.FLEE:
        break;
    // on level up
    case BattleInputStages.LEVEL_STAT_DELTA:
        battle_input_processing_level_stat_delta();
        break;
    case BattleInputStages.LEVEL_STAT_TOTAL:
        battle_input_processing_level_stat_total();
        break;
    // switching before your opponent sends something in
    case BattleInputStages.SWITCH_BEFORE_TURN:
        battle_input_processing_switch(battle_input_processing_control_switch_before_turn);
        break;
}
