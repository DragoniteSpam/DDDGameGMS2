/// @description  boolean battle_continue();
// Returns true if it executed something, false if it did not.

if (!ds_queue_empty(individual_actions)){
    battle_begin_individual_action();
    return true;
} else if (!ds_queue_empty(round_actions)){
    // this may do other things but it may also just populate
    // the individual actions
    battle_begin_round_action();
    return true;
} else if (!ds_queue_empty(actions)){
    // this exists to populate the round actions
    battle_begin_action();
    battle_advance();
    return true;
}

return false;
