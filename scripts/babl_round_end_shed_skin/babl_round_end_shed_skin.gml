/// @description  void babl_round_end_shed_skin(queue, BattlePokemon, ability);
/// @param queue
/// @param  BattlePokemon
/// @param  ability

if (argument1.status!=MajorStatus.NONE){
    if (random(100)<World.settings.battle.ability_shed_skin_heal_rate){
        ds_queue_enqueue(argument0, add_battle_round_action(battle_individual_action_set_major_status, argument1, MajorStatus.NONE, 0));
        var status_name=string_lower(World.major_status_names[argument1.status]);
        var text=choose_gender(argument1.gender, L("%0's %1 cured his %2!", argument1.name, argument2.name, status_name),
            L("%0's %1 cured her %2!", argument1.name, argument2.name, status_name),
            L("%0's %1 cured its %2!", argument1.name, argument2.name, status_name));
        ds_queue_enqueue(argument0, add_battle_round_action(battle_round_action_text, text));
    }
}
