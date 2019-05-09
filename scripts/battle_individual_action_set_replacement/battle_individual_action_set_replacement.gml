/// @description  void battle_individual_action_set_replacement(params);
/// @param params
// 0: team slot
// 1: replacement index

var params=argument0;

Battle.replacements[| params[| 0]]=params[| 1];
battle_advance();
