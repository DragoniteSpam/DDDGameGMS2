// This checks to see if you decided to switch any of your Pokémon before
// a foe sends in a new Pokémon. Foes can't do this to you, but it would
// theoretically work for them too.

for (var i=0; i<ds_list_size(replacements); i++){
    if (replacements[| i]!=noone){
        var team=Battle.teams[| i];
        var in_battle=Battle.contestants[| i];
        var new_battler=team.owner.party[| Battle.replacements[| i]];
        if (alive(in_battle)){
            // This is the wrong kind of action but we can get away with using it here
            // because it doesn't do anything specific.
            if (team.owner==Camera.following){
                ds_queue_enqueue(round_actions, add_battle_round_action(battle_individual_action_text, L("%0, come back!", Battle.contestants[| i].name)));
            } else {
                ds_queue_enqueue(round_actions, add_battle_round_action(battle_individual_action_text, L("%0 called back %1!", team.name, Battle.contestants[| i].name)));
            }
            ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_anim_retract_pokemon_hud, i));
            ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_anim_retract_contestant, i));
            // And again.
            ds_queue_enqueue(round_actions, add_battle_round_action(battle_individual_action_wait, 0.25, true));
        }
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_change_contestant, i));
        // And again.
        if (team.owner==Camera.following){
            ds_queue_enqueue(round_actions, add_battle_round_action(battle_individual_action_text, L("Go, %0!", new_battler.name)));
        } else {
            ds_queue_enqueue(round_actions, add_battle_round_action(battle_individual_action_text, L("%0 sent out %1!", team.name, new_battler.name)));
        }
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_anim_submit_contestant, i));
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_anim_send_in_pokemon_hud, i));
        // This gets done after all replacements have been sent in. If you copy this effect
        // for something like Whirlwind or Roar, uncomment it and comment out the flag.
        new_battler.fired_entry_ability=false;
        //ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_entry_abilities, i));
    }
}
