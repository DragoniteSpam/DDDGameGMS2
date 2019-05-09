var pkmn=Battle.input_processing;

if (DEBUG&&keyboard_check_released(vk_f1)){
    if (message_option_index<MOVE_LIMIT){
        var n=message_option_index;
        if (pkmn.moves[n]!=-1){
            if (pkmn.move_pp[n]==0){
                pkmn.move_pp[n]=1;
            } else {
                pkmn.move_pp[n]=0;
            }
        }
    }
}

var continue_text="";

if (total_pp(pkmn)==0){
    // todo: move pp
    var value=World.move_struggle;
    // struggle automatically hits a random adjacent foe, if you want to change the
    // move here, you might want to un-hard code this
    var valid_targets=battle_get_valid_targets(pkmn, value);
    var targets=ds_list_create();
    ds_list_add(targets, random_element_from_list(valid_targets));
    ds_list_destroy(valid_targets);
    
    battle_prioritize(add_battle_executable_action(BattleActions.MOVE, pkmn, targets, value));
    
    battle_input_processing_reset();
    
    continue_text=pkmn.name+" has no valid moves, struggling";
} else {
    var max_n=array_length_1d(pkmn.moves)+1;
    
    draw_moves_list(pkmn, message_option_index);    
    message_option_index=menu_input(message_option_index, max_n);
    
    if (Battle.view_details&&message_option_index<max_n-1){
        draw_moves_details(pkmn.moves[message_option_index]);
    }
    
    // todo some key press to view move details
    
    if (Controller.release_b){
        battle_input_processing_reset(false);
    } else if (Controller.release_x){
        // todo put a button prompt here so people know it exists
        Battle.view_details=!Battle.view_details;
    } else if (Controller.release_a){
        if (message_option_index==MOVE_LIMIT){
            battle_input_processing_reset(false);
        } else if (pkmn.moves[message_option_index]==noone){
            // to do play some kind of silly 'invalid' sound
        } else if (pkmn.move_pp[message_option_index]==0){
            message(L("There is no PP left for that move!"));
        } else {
            pkmn.move_pp[message_option_index]--;
            var value=pkmn.moves[message_option_index];
            // at some point in the future this needs to be moved to a different script that can
            // account for selecting multiple valid targets
            var valid_targets=battle_get_valid_targets(pkmn, value);
            var targets=ds_list_create();
            ds_list_add(targets, random_element_from_list(valid_targets));
            ds_list_destroy(valid_targets);
            
            battle_prioritize(add_battle_executable_action(BattleActions.MOVE, pkmn, targets, value));
            
            battle_input_processing_reset();
            
            continue_text=pkmn.owner.name+" has chosen the move "+get_move(pkmn.moves[message_option_index]).name+" for "+pkmn.name;
        }
    }
}

// as with a few places in this code, this isn't 100% necessary because
// you'll return from the inner battle_advance EVENTUALLY to clean up the
// data structures, but it makes me feel better to put that off until
// the end.
if (string_length(continue_text)>0){
    battle_debug(continue_text);
}
