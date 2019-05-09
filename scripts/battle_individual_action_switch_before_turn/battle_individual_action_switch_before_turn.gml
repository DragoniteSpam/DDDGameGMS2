/// @description  void battle_individual_action_switch_before_turn(params);
/// @param params
// 1: battlefield slot to fill

var params=argument0;

var result=World.message_option_result;
World.message_option_result=-1;

// This looks extremely bizarre since 0 is usually false and
// 1 is usually true, but in this case we're actually checking
// to see if the result is equal to zero.
if (result==0){
    battle_input_processing_reset(false, BattleInputStages.SWITCH_BEFORE_TURN);
    Battle.misc_data[? "contestant slot to replace"]=params[| 0];
    Battle.misc_data[? "allowed to not send anybody in"]=true;
    Battle.input_processing=Battle.contestants[| params[| 0]];
    message(L("Who would you like to send in to replace %0?", Battle.contestants[| params[| 0]].name));
} else {
    Battle.replacements[| params[| 0]]=noone;
    battle_advance();
}
