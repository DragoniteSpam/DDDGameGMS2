var text_list=ds_list_create();
ds_list_add(text_list, L("Fight!"), L("Item"), L("Switch"), L("Flee"));

if (DEBUG||World.settings.battle.idle_allowed){
    ds_list_add(text_list, L("Idle"));
}
if (DEBUG){
    ds_list_add(text_list, L("[Auto-heal]"));
    ds_list_add(text_list, L("[Auto-KO]"));
    ds_list_add(text_list, L("[Auto-Victory]"));
}

var max_n=ds_list_size(text_list);

draw_menu_from_list(text_list, World.message_option_index);
World.message_option_index=menu_input(World.message_option_index, max_n);

var debug_text="";

if (Controller.release_a){
    switch (World.message_option_index){
        case 0:
            battle_input_processing_reset(false, BattleInputStages.MOVE);
            break;
        case 1:
            if (pawn_item_total(Battle.input_processing.owner)==0){
                message(L("%0 has no available items!", Battle.input_processing.owner.name));
            } else {
                battle_input_processing_reset(false, BattleInputStages.ITEM);
            }
            break;
        case 2:
            if (!pokemon_can_escape(Battle.input_processing)){
                message(L("%0 is trapped and can't get away!", Battle.input_processing.name));
            } else {
                battle_input_processing_reset(false, BattleInputStages.SWITCH);
            }
            break;
        case 3:
            // todo if this turns into a 'forfeit' button for Trainer battles,
            // you may want to bypass this check
            var team_trapped=false;
            // the runtime for this actually isn't very good but it's rare that
            // it's going to process a large number of things so i don't mind
            // too much
            for (var i=0; i<ds_list_size(Battle.contestants); i++){
                var contestant=Battle.contestants[| i];
                if (contestant.owner.team==Battle.input_processing.owner.team&&!pokemon_can_escape(contestant)){
                    team_trapped=true;
                    break;
                }
            }
            // todo in wild battles in normal pokémon, if your speed stat is
            // too low, you may be unable to escape. i hate this mechanic and
            // won't be implementing it. you can, though.
            if (team_trapped){
                message(L("Your team is trapped and unable to flee!"));
            } else {
                //battle_input_processing_reset(BattleInputStages.FLEE);
                message(L("You aren't allowed to flee during the demo!"));
            }
            break;
        // because we sort of know the order in which these options will appear
        // (if Idle exists it WILL be fourth, and if the debug options exist
        // we know Idle also has to) we can cheat with these case statements a
        // little.
        // in general you would probably want to have a way to make sure you
        // selected what you think you selected, though.
        case 4:
            var pkmn=Battle.input_processing;
            battle_prioritize(add_battle_executable_action(BattleActions.IDLE, pkmn, noone, 0));
            battle_input_processing_reset();
            debug_text=pkmn.owner.name+" has chosen to idle for "+pkmn.name;
            break;
        case 5:
            var pkmn=Battle.input_processing;
            battle_prioritize(add_battle_executable_action(BattleActions.AUTOHEAL, pkmn, noone, 0));
            battle_input_processing_reset();
            debug_text=pkmn.owner.name+" has chosen to auto-full-heal "+pkmn.name;
            break;
        case 6:
            var pkmn=Battle.input_processing;
            battle_prioritize(add_battle_executable_action(BattleActions.AUTOKO, pkmn, battle_get_valid_targets(pkmn), 0));
            battle_input_processing_reset();
            debug_text=pkmn.owner.name+" has chosen to auto-KO all foes with "+pkmn.name;
            break;
        case 7:
            var pkmn=Battle.input_processing;
            battle_prioritize(add_battle_executable_action(BattleActions.AUTOVICTORY, pkmn, battle_get_valid_targets(pkmn), 0));
            battle_input_processing_reset();
            debug_text=pkmn.owner.name+" has chosen to end the battle with "+pkmn.name;
            break;
    }
}

ds_list_destroy(text_list);

// It's a good idea to delete the list before continuing, so we just make a note
// that we need to continue at the end.
if (string_length(debug_text)>0){
    battle_debug(debug_text);
}
