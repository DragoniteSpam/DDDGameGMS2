/// @description  void battle_individual_action_refresh(BattleIndividualAction);
/// @param BattleIndividualAction
// 0: target (single)

var params=argument0;

pokemon_reset_volatile_stat_mods(params[| 0]);

battle_advance();
