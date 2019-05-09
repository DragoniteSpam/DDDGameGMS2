/// @description  void bi_post_turn_leftovers(queue, BattlePokemon, item);
/// @param queue
/// @param  BattlePokemon
/// @param  item

if (pokemon_hp_f(argument1)<1){
    // there are some conditions that can cause this to fail such as
    // Heal Block effects or probably the Klutz ability, but none of them
    // are going to come into play here
    var item=get_item(argument2);
    // todo hold item animation
    var amount=min(floor(argument1.act[Stats.HP]/16), argument1.act[Stats.HP]-argument1.act_hp);
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_scroll_health, argument1, -amount));
    var text=choose_gender(argument1.gender, L("%0 restored a bit of health with his %1!", argument1.name, item.name),
        L("%0 restored a bit of health with her %1!", argument1.name, item.name),
        L("%0 restored a bit of health with its %1!", argument1.name, item.name));
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_text, text));
}
