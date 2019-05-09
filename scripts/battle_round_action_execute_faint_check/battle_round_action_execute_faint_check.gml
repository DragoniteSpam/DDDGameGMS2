/// @description  battle_round_action_execute_faint_check(queue, user, target, damage);
/// @param queue
/// @param  user
/// @param  target
/// @param  damage
// DO NOT QUEUE THIS. IT DOES NOT RETURN A VALUE. THE GAME WILL PROBABLY CRASH.
// It takes the queue as a parameter instead.

if (argument3>=argument2.act_hp){
    var base=get_pokemon(argument1.species);
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_death, argument2));
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_round_action_anim_retract_pokemon_hud, argument2.position));
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_text, L("%0 fainted!", argument2.name)));
    argument2.flag_downed=true;
    // todo: post-death effects, such as aftermath, destiny bond, etc
    // you don't gain experience from taking down teammates, allies or yourself
    // todo this will also not give you experience if the foe dies to something indirect like poison.
    // this is because of the stuff in place to make implementing multiplayer not literally the worst
    // thing ever. it would probably be a good idea to find a way around that for singleplayer.
    if (argument1.owner.object_index==PawnPlayer&&argument1.owner.team!=argument2.owner.team){
        // todo this but for all pokémon involved in the takedown, and whoever holds an exp share,
        // and if the exp all is turned on
        // also you should probably make sure the victorious pokémon(s) are still alive
        var level=get_pokemon_level(argument1);
        if (level<MAX_LEVEL){
            // todo aggregate experience gain, i.e. if two pokémon go down at the same time you only gain
            // experience once
            var exp_gain=exp_reward(argument1, argument2);
            var exp_next_level=get_experience(level+1, base.growth_rate);
            if (exp_gain==1){
                ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_text, L("%0 gained one experience point!", argument1.name)));
            } else {
                ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_text, L("%0 gained %1 experience points!", argument1.name, string_commas(exp_gain, true))));
            }
            var to_grow=min(exp_gain, exp_next_level-argument1.experience);
            ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_exp_gain, argument1, argument1.experience, to_grow));
            if (argument1.experience+exp_gain>=exp_next_level){
                // dont use get_pokemon_level here because you're fetching the future level not
                // the current one
                var new_level=get_level(argument1.experience+exp_gain, base.growth_rate);
                ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_text, L("%0 grew to level %1!", argument1.name, string(new_level))));
                ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_level_gain, argument1, level, new_level));
                if (argument1.experience+exp_gain>exp_next_level){
                    var new_level_exp=get_experience(new_level, base.growth_rate);
                    var remainder=argument1.experience+exp_gain-new_level_exp;
                    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_exp_gain, argument1, new_level_exp, remainder));
                }
                // todo learning new moves
            }
        }
    } // i don't know what foes gaining experience would look like, but you're free to try it out all the same
} // endif type effectiveness
