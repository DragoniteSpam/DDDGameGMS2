/// @description  void battle_round_post_trap_damage(params);
/// @param params
// 0: position

var pkmn=Battle.contestants[| argument0[| 0]];

if (pkmn.trapped_residual_damage>0&&pkmn.trapped_by!=-1){
    var trapper=Battle.contestants[| pkmn.trapped_by];
    var amount=pkmn.trapped_residual_damage*pkmn.act[Stats.HP];
    // todo Wonder Guard, etc
    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_scroll_health, pkmn, amount));
    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, L("%0 was hurty by %1's %2!", pkmn.name, pkmn.owner.name, trapper.name)));
    
    battle_round_action_execute_faint_check(individual_actions, trapper, pkmn, amount);
}

battle_advance();
