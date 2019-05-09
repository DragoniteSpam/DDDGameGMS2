/// @description  int battle_ai_withdraw(BattlePokemon, always?);
/// @param BattlePokemon
/// @param  always?

var user=argument0;
var should_switch=argument1;

if (!pokemon_can_escape(user)){
    return noone;
}

var type_check=false;
var move_type=-1;
var skill=max(TrainerAI.MINIMUM, get_trainer_class(get_trainer(user.owner.trainer_index).class).ai);
var valid_targets=battle_get_valid_targets(user);

var result=noone;

if (user.turn_count>0){
    if (skill>=TrainerAI.HIGH){
        for (var i=0; i<ds_list_size(valid_targets); i++){
            var target=Battle.contestants[| valid_targets[| i]];
            // each valid opponent who you are poorly matched against increases the
            // chance that you switch. it's slightly different from the default AI
            // but probably shouldn't be game-breaking.
            if (alive(target)&&target.last_move>-1){
                var move=get_move(target.last_move);
                if (abs(get_pokemon_level(target)-get_pokemon_level(user))<=6){
                    var type_mod=get_matchup_on(move.type, user, noone, target);
                    if (move.value>70&&type_mod>=2){
                        should_switch=should_switch||(random(100)<30);
                    } else if (move.value>50&&type_mod>=2){
                        should_switch=should_switch||(random(100)<20);
                    }
                }
            }
        }
    }
}

if (total_pp(user)==0){
    should_switch=true;
}
// todo high-skilled trainers who are not under the influence of Perish Song
// and who have Baton Pass access should make a note that they have Baton Pass

// todo medium-skilled trainers who are under the influence of Encore should
// check if the move they're Encore'd into is still useful

// todo high-skilled trainers should notice if their opponent is in the middle
// of Hyper Beam, etc. or Truant and think about switching

// todo something about a sudden death game rule which I've never heard of

// todo if perish song count is 1 switch

if (should_switch){
    var priority=ds_priority_create();
    for (var i=0; i<ds_list_size(user.owner.party); i++){
        var prospective=user.owner.party[| i];
        if (!battle_is_on_field(prospective)&&alive(prospective)){
            // todo if perish count is 1, consider switching even if there are
            // entry hazards on the ground
            
            // this one actually differs quite drastically from the default ai:
            // instead of looking for the matchup of the last move of a single
            // opponent, each valid pokémon in the party checks to see how much
            // it doesn't (or does) want to be on the battlefield
            var scary=0;
            for (var j=0; j<ds_list_size(valid_targets); j++){
                var target=Battle.contestants[| valid_targets[| j]];
                if (target.last_move>-1){
                    var move=get_move(target.last_move);
                    var matchup=get_matchup_on(move.type, prospective, target);
                    // bigger number is scarier
                    if (matchup>1){
                        scary++;
                    } else if (matchup<1){
                        scary--;
                    }
                }
                // this isn't 100% because it only checks your defined types and not
                // the actual moves you carry
                var me_on_them=get_matchup_on_pokemon(prospective, target);
                if (me_on_them>1){
                    scary=scary-2;
                } else if (me_on_them<1){
                    scary=scary+2;
                }
            }
            // default ai would have you only do this if you passed a random roll, but
            // since you're adding based on priority ("scary") here anyway there's not
            // really a point
            ds_priority_add(priority, i, scary);
        }
    }
    
    if (ds_priority_size(priority)>0){
        // todo if baton pass available?
        // the teammate who's least terrified by the battlefield
        result=add_battle_executable_action(BattleActions.SWITCH, user, noone, ds_priority_find_min(priority));
    }
    
    ds_priority_destroy(priority);
}

ds_list_destroy(valid_targets);

return result;
