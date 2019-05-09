/// @description  void battle_input_processing_reset([reset input processing?], [stage]);
/// @param [reset input processing?]
/// @param  [stage]

var reset_input_processing=true;
var target_stage=BattleInputStages.GRAND;
switch (argument_count){
    case 2:
        target_stage=argument[1];
    case 1:
        reset_input_processing=argument[0];
    default:
        break;
}

// this is a little silly considering what the script is named
if (reset_input_processing){
    Battle.input_processing=noone;
}

Battle.input_stage=target_stage;
Battle.view_details=false;
World.message_option_index=0;
