/// @description  BattleExecutableAction battle_ai_choose_move_old(user);
/// @param user
// This is what I copied out of the default Essentials AI. It does a lot
// of math and as far as I can tell most of it isn't very important. See
// battle_ai_choose_move instead.

return noone;

var user=argument0;

var skill=max(TrainerAI.MINIMUM, get_trainer_class(get_trainer(user.owner.trainer_index).class).ai);
var can_escape=pokemon_can_escape(user);
var move_scores=array_create(array_length_1d(user.moves));
array_clear(move_scores, 0);
var total_score=0;
var choices=ds_list_create();

var result=noone;

var valid_targets=battle_get_valid_targets(user);
var target=Battle.contestants[| random_element_from_list(valid_targets)];
ds_list_destroy(valid_targets);

// todo in wild battles all moves have an equal chance of being chosen
// (provided that they pass the battle_ai_can_choose_move check)

for (var i=0; i<array_length_1d(user.moves); i++){
    if (battle_ai_can_choose_move(user, i)){
        move_scores[i]=battle_ai_move_score(user.moves[i], user, target, skill);
        // todo if move targets teammates as well, reduce the score if
        // the move would be devastating on your teammate(s)
        ds_list_add(choices, i);
        total_score=total_score+move_scores[i];
    }
}

var max_score=array_max(move_scores);

if (skill>=TrainerAI.MEDIUM){
    var threshold=3;
    var new_score=15;
    
    if (skill>=TrainerAI.BEST){
        threshold=1.5;
        new_score=10;
    } else if (skill>=TrainerAI.HIGH){
        threshold=2;
        new_score=5;
    }
    
    for (var i=0; i<array_length_1d(move_scores); i++){
        if (move_scores[i]>new_score&&move_scores[i]*threshold<max_score){
            total_score=total_score-(move_scores[i]-new_score);
            move_scores[i]=new_score;
        }
    }
    
    max_score=array_max(move_scores);
}

if (max_score>100){
    var deviation=array_standard_deviation(move_scores);
    // if one move is strongly preferred over the others
    if (deviation>=40){
        var preferred=ds_list_create();
        for (var i=0; i<array_length_1d(move_scores); i++){
            if (user.moves[i]>-1&&(move_scores[i]>=0.8*max_score||move_scores[i]>=200)){
                ds_list_add(preferred, i);
                // add the top scoring move twice
                if (move_scores[i]==max_score){
                    ds_list_add(preferred, i);
                }
            }
        }
        if (ds_list_size(preferred)>0){
            var index=random_element_from_list(preferred);
            var targets=battle_get_valid_targets(user, user.moves[index]);
            result=add_battle_executable_action(BattleActions.MOVE, user, targets, user.moves[index]);
        }
        ds_list_destroy(preferred);
    }
}

if (result==noone){
    // I'm not quite sure what this entire block of code is for. The
    // "should you withdraw?" question has already been asked before
    // this script runs.
/*    var bad_moves=false;
    if ((max_score<=20&&user.turn_count>2)||(max_score<=30&&user.turn_count>5)&&random(10)<8){
        bad_moves=true;
    }
    if (total_score<100&&user.turn_count>1){
        bad_moves=true;
        var move_count=0;
        for (var i=0; i<array_length_1d(user.moves); i++){
            if (user.moves[i]>-1){
                if (move_scores[i]>0&&get_move(user.moves[i]).value>0){
                    bad_moves=false;
                }
                move_count++;
            }
        }
        // not sure what this is for. the odds of floating-point random being
        // equal to zero is infinitesimal.
        //bad_moves=bad_moves&&(random(10)!=0);
    }*/
    
//    if (bad_moves){
    if (false){
        result=noone;
    } else {
        // it's unlikely that this will ever happen with bad_moves not being set to
        // true, but possible
/*        if (max_score<=0){
            if (ds_list_size(choices)>0){
                var index=random_element_from_list(choices);
                var targets=battle_get_valid_targets(user, index);
                result=add_battle_executable_action(BattleActions.MOVE, user, targets, user.moves[index]);
            }
            // else if you can only struggle, do that in the calling script because
            // it's a last resort if nothing else is possible
        }*/
    }
}

ds_list_destroy(choices);

return result;
