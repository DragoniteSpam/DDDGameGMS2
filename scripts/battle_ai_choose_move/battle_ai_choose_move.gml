/// @description  BattleExecutableAction battle_ai_choose_move(user);
/// @param user

var user=argument0;

var skill=max(TrainerAI.MINIMUM, get_trainer_class(get_trainer(user.owner.trainer_index).class).ai);
var move_scores=array_create(array_length_1d(user.moves));
array_clear(move_scores, 0);
var valid_move=false;

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
        valid_move=true;
    }
}

if (!valid_move){
    return noone;
}

var best=user.moves[array_max_index(move_scores)];

return add_battle_executable_action(BattleActions.MOVE, user, battle_get_valid_targets(user, best), best);
