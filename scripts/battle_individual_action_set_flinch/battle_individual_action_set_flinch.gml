/// @description  void battle_individual_action_set_flinch(params);
/// @param params
// 0: user

var params=argument0;

params[| 0].flinch=true;

battle_advance();
