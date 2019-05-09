/// @description  void battle_input_player(team, pokemon);
/// @param team
/// @param  pokemon

// zero out everything
battle_input_processing_reset();

input_processing=argument0;

// continue: in the message()
message(L("What will %0 do?", argument0.name));
