/// @description  void battle_round_action_input(params);
/// @param params
// 0: team index

var pokemon=Battle.contestants[| argument0[| 0]];

// continue: inside these scripts
script_execute(pokemon.owner.battle_input_script, pokemon);
