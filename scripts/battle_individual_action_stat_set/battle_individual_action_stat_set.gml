/// @description  void battle_individual_action_stat_set(params);
/// @param params
// 0: user
// 1. stat
// 2. value

var params=argument0;

params[| 0].mods[params[| 1]]=params[| 2];

battle_advance();
