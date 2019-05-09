/// @description  void be_user_heal_half(user, target, move id);
/// @param user
/// @param  target
/// @param  move id

var user=argument0;     // unused here
var target=argument1;   // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (pokemon_hp_f(argument0)<1){
        var amount=min(floor(argument0.act[Stats.HP]/2), argument0.act[Stats.HP]-argument0.act_hp);
        // amount is negative because we're 'dealing' negative 'damage'
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_scroll_health, argument0, -amount));
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, L("%0's health was restored!", argument0.name)));
    } else {
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, L("%0 is already healthy!", argument0.name)));
    }
    
    return id;
}
