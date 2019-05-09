/// @description  void battle_round_action_execute(params);
/// @param params
// 0: BattleExecutableAction

var exe=argument0[| 0];

var pokemon=exe.user;

if (!pokemon.flag_downed&&debug_win==noone){
    switch (exe.action){
        case BattleActions.MOVE:
            var base=get_pokemon(pokemon.species);
            var move=get_move(exe.value);
            var interrupted=false;
            
            switch (pokemon.status){
                case MajorStatus.PARALYZE:
                    if (random(1)<World.settings.battle.paralyze_immobilization_odds){
                        interrupted=true;
                        ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, L("%0 is paralyzed and unable to move!", pokemon.name)));
                    }
                    break;
                case MajorStatus.SLEEP:
                    // when this is set, it should generate a random number of turns between 1
                    // and(according to Serebii) 7, which decreases once each time this is checked
                    // or twice if you have a sleep-hastening ability
                    break;
                case MajorStatus.FREEZE:
                    // on each turn there's a 20% chance of being thawed; no status turn counter necessary
                    break;
            }

            if (!interrupted){
                if (pokemon.flinch&&pokemon.ability.can_flinch){
                    interrupted=true;
                    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, L("%0 flinched and couldn't move!", pokemon.name)));
                }
            }
            
            if (!interrupted){
                // if this check is not in place the 'snapped out of confusion' message will appear on
                // every single turn and that's incorrect
                if (pokemon.confused>0){
                    if (max(--pokemon.confused, 0)==0){
                        ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, L("%0 snapped out of confusion!", pokemon.name)));
                    } else {
                        ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, L("%0 is confused!", pokemon.name)));
                        // todo animation
                        // todo in gen 7 apparently the confusion chance is one in three instead of one in two
                        if (choose(true, false)){
                            interrupted=true;
                            // todo animation
                            var damage=battle_damage(World.move_confusion, pokemon, pokemon);
                            ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_scroll_health, pokemon, damage));
                            var msg=choose_gender(pokemon.gender, L("%0 hit himself in confusion!", pokemon.name),
                                L("%0 hit herself in confusion!", pokemon.name),
                                L("%0 hit itself in confusion!", pokemon.name));
                            ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, msg));
                            battle_round_action_execute_faint_check(individual_actions, pokemon, pokemon, damage);
                        }
                    }
                }
            }
            
            if (!interrupted){
                var applied_effects=ds_list_create();
                // calculate effects, chance of hitting, damage multipliers, etc
                // Iterating over each target multiple times (effect calculation, hit calculation, actual
                // turn processing, etc) feels kind of bad but it's probably the easiest way to do this
                for (var i=0; i<ds_list_size(exe.targets); i++){
                    var sublist=ds_list_create();
                    Battle.misc_data[? "stat raise animations"]=0;
                    Battle.misc_data[? "stat fall animations"]=0;
                    for (var j=0; j<ds_list_size(move.effects); j++){
                        if (irandom(100)<=move.effect_odds[| j]||(DEBUG&&keyboard_check(vk_control))){
                            var effect_result=script_execute(move.effects[| j], pokemon, Battle.contestants[| exe.targets[| i]], exe.value);
                            if (effect_result!=noone){
                                ds_list_add(sublist, effect_result);
                            }
                        }
                    }
                    ds_list_add(applied_effects, sublist);
                }
                var has_succeeded_probably=false;
                var hit=battle_get_hit(move, pokemon, exe.targets, applied_effects);
                var damage_total=0;
                var damage_attempts=array_sum(hit);
                var effect_total=0;
                // todo: check for flinches or other conditions which may invalidate the entire turn
                ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, L("%0 used %1!", pokemon.name, move.name)));
                // todo: other conditions under which a move may fail
                
                var hit_count=0;
                for (var i=0; i<array_length_1d(hit); i++){
                    if (hit[i]){
                        hit_count++;
                    }
                }
                
                if (hit_count>0){
                    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_animation_move, pokemon, ds_list_clone(exe.targets), move/*there may be other data that needs to go here at some point but i'm pretty sure it can all be derived from this*/));
                }
                // the fact that i need to do basically the same thing twice is upsetting
                for (var i=0; i<array_length_1d(hit); i++){
                    var target=Battle.contestants[| exe.targets[| i]];
                    target.animate_on=false;
                    var target_effects_list=applied_effects[| i];
                    if (move.category!=MoveCategories.STATUS){
                        has_succeeded_probably=true;
                    }
                    // the obvious part: if you're marked as being hit, execute the action, otherwise, ignore it
                    if (hit[i]){
                        // the less obvious part: if you're not marked as being already fainted, execute the action, otherwise, ignore it
                        if (!target.flag_downed){
                            if (move.category!=MoveCategories.STATUS){
                                // todo sort this out (calculating whether a hit is critical or not: remember, some conditions
                                // increase critical hit chances, and others negate them entirely)
                                var matchup=get_matchup_on(move.type, target, target_effects_list);
                                if (matchup==0){
                                    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, L("But it doesn't affect %0...", target.name)));
                                } else {
                                    var critical_hit_threshold=1;
                                    var critical=irandom(16)<critical_hit_threshold;
                                    var damage=battle_damage(move, pokemon, target, critical, target_effects_list);
                                    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_scroll_health, target, damage));
                                    if (matchup>1){
                                        // this could be compacted a little but that would make potential localization a little bit tricky
                                        if (array_length_1d(hit)>1){
                                            var matchup_message=L("It's super effective on %0!", target.name);
                                        } else {
                                            var matchup_message=L("It's super effective!");
                                        }
                                        ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, matchup_message));
                                    } else if (matchup<1){
                                        // this could be compacted a little but that would make potential localization a little bit tricky
                                        if (array_length_1d(hit)>1){
                                            var matchup_message=L("It's not very effective on %0...", target);
                                        } else {
                                            var matchup_message=L("It's not very effective...");
                                        }
                                        ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, matchup_message));
                                    }
                                    if (critical){
                                        if (array_length_1d(hit)>1){
                                            var critical_message=L("A critical hit on %0", target.name);
                                        } else {
                                            var critical_message=L("A critical hit!");
                                        }
                                        ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, critical_message));
                                    }
                                    target.animate_on=true;
                                    damage_total=damage_total+min(damage, target.act_hp);
                                    battle_round_action_execute_faint_check(individual_actions, pokemon, target, damage);
                                }
                            }
                            // apply move effects here, if the target is still alive
                            for (var j=0; j<ds_list_size(target_effects_list); j++){
                                var eff=target_effects_list[| j];
                                if (eff!=noone){
                                    if (!eff.cancel_if_target_fainted||!target.flag_downed){
                                        while (!ds_queue_empty(eff.scheduled_actions)){
                                            ds_queue_enqueue(individual_actions, ds_queue_dequeue(eff.scheduled_actions));
                                            effect_total++;
                                            has_succeeded_probably=true;
                                            target.animate_on=true;
                                        }
                                    }
                                }
                                instance_destroy(eff);
                            }
                            if (move_get_flag(move, MoveFlags.CONTACT)){
                                script_execute(target.ability.on_contact, pokemon, target, target.ability, move);
                            }
                        } // endif target was alive to begin with
                    } else {
                        ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, L("%0 avoided the attack!", target.name)));
                    } // endif hit[i]
                }
                // delete the applied effects list, and any lists it contains
                for (var i=0; i<ds_list_size(applied_effects); i++){
                    ds_list_destroy(applied_effects[| i]);
                }
                ds_list_destroy(applied_effects);
                // if absolutely nothing of interest happened in this battle, inform the game of your failure
                if (!has_succeeded_probably){
                    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, L("But it failed!")));
                }
                
                if (damage_total==0){
                    pokemon.momentum_turn=0;
                    pokemon.momentum_move=-1
                }
                
                // it doesn't have to succeed but as long as the move lands this gets set
                pokemon.last_move=exe.value;
            }
            break;
        case BattleActions.ITEM:
            script_execute(get_item(exe.value).battle_use_action, individual_actions, pokemon, exe.value);
            break;
        case BattleActions.SWITCH:
            // This is very much the same as the code in battle_action_check_replacements_before_turn.
            // I may see about combining them at some point, but the data that they act on is slightly
            // different, so that may not work. Also, Pursuit can interfere with this version. Also,
            // it uses a different queue. it's certainly possible to fix that, but honestly it's probably
            // just easier to maintain two separate versions.
            var team=Battle.teams[| pokemon.position];
            Battle.replacements[| pokemon.position]=exe.value;
            var new_battler=team.owner.party[| exe.value];
            if (team.owner==Camera.following){
                ds_queue_enqueue(individual_actions, add_battle_round_action(battle_individual_action_text, L("%0, come back!", pokemon.name)));
            } else {
                ds_queue_enqueue(individual_actions, add_battle_round_action(battle_individual_action_text, L("%0 called back %1!", team.name, pokemon.name)));
            }
            ds_queue_enqueue(individual_actions, add_battle_round_action(battle_round_action_anim_retract_pokemon_hud, pokemon.position));
            ds_queue_enqueue(individual_actions, add_battle_round_action(battle_round_action_anim_retract_contestant, pokemon.position));
            ds_queue_enqueue(individual_actions, add_battle_round_action(battle_individual_action_wait, 0.25, true));
            // this requires that Battle.replacements[| n] is set correctly. fortunately, we do that a
            // few lines up.
            ds_queue_enqueue(individual_actions, add_battle_round_action(battle_round_action_change_contestant, pokemon.position));
            if (team.owner==Camera.following){
                ds_queue_enqueue(individual_actions, add_battle_round_action(battle_individual_action_text, L("Go, %0!", new_battler.name)));
            } else {
                ds_queue_enqueue(individual_actions, add_battle_round_action(battle_individual_action_text, L("%0 sent out %1!", team.name, new_battler.name)));
            }
            ds_queue_enqueue(individual_actions, add_battle_round_action(battle_round_action_anim_submit_contestant, pokemon.position));
            ds_queue_enqueue(individual_actions, add_battle_round_action(battle_round_action_anim_send_in_pokemon_hud, pokemon.position));
            // This gets done after all replacements have been sent in, at a priority of one less than
            // switching but way above actual moves. If you copy this effect for something like Whirlwind
            // or Roar, uncomment it.
            //ds_queue_enqueue(individual_actions, add_battle_round_action(battle_round_action_entry_abilities, pokemon.position));
            break;
        case BattleActions.SWITCH_FIRE_ABILITY:
            ds_queue_enqueue(individual_actions, add_battle_round_action(battle_round_action_entry_abilities, pokemon.position));
            break;
        case BattleActions.FLEE:
            ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, L("%0 fled! (Implement this later, please.)", pokemon.name)));
            break;
        case BattleActions.IDLE:
            ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, L("%0 is just hanging around!", pokemon.name)));
            break;
        case BattleActions.AUTOHEAL:
            var amount=min(pokemon.act[Stats.HP], pokemon.act[Stats.HP]-pokemon.act_hp);
            if (amount>0){
                // nothing bad will happen if you do this for a total of zero health but it saves the
                // computer a bit of effort
                ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_scroll_health, pokemon, -amount));
            }
            ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_refresh, pokemon));
            ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, L("%0 was restored!", pokemon.name)));
            break;
        case BattleActions.AUTOKO:
            for (var i=0; i<ds_list_size(exe.targets); i++){
                var target=Battle.contestants[| exe.targets[| i]];
                if (target.flag_downed){
                    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, L("%0 has already fainted!", target.name)));
                } else {
                    // it seems sort of dumb that you can only modify a pokémon's hp by calling the 'scroll health' animation.
                    // i don't know why i did it like that.
                    damage=target.act_hp;
                    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_scroll_health, target, damage));
                    battle_round_action_execute_faint_check(individual_actions, pokemon, target, damage);
                    target.flag_downed=true;
                }
            }
            break;
        case BattleActions.AUTOVICTORY:
            ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, L("%0 has forcefully ended the battle. %1 wins!", pokemon.name, pokemon.owner.name)));
            // todo remove (one of) the loser pawns' pokémon from the battlefield, to make room for the pawn's trainer to
            // show up on the end battle screen
            debug_win=pokemon.owner;
            break;
    }
}

pokemon.trapped_for=max(--pokemon.trapped_for, 0);

instance_destroy(exe);

// continue:
battle_advance();
