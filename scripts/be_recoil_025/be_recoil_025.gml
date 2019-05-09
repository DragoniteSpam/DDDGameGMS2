/// @description  void be_recoil_025(user, target, move id);
/// @param user
/// @param  target
/// @param  move id

var target=argument1;   // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    // todo not if user has that one ability that blocks recoil damage
    var amount=min(floor(argument0.act[Stats.HP]/4), argument0.act_hp);
    ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_scroll_health, argument0, amount));
    ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, L("%0 was hurt by the recoil!", argument0.name)));
    battle_round_action_execute_faint_check(scheduled_actions, argument0, argument0, amount);
    
    return id;
}
