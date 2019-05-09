/// @description  void battle_round_action_entry_abilities(params);
/// @param params
// 0: contestant index

var user=Battle.contestants[| argument0[| 0]];

script_execute(user.ability.on_entry, individual_actions, Battle.contestants[| argument0[| 0]]);
user.fired_entry_ability=true;

battle_advance();
