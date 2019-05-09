/// @description  double baim_confuse(move id, user, target, skill, move score);
/// @param move id
/// @param  user
/// @param  target
/// @param  skill
/// @param  move score

var move=get_move(argument0);
var user=argument1;
var target=argument2;
var skill=argument3;
var move_score=argument4;

// todo some things may block confusion
if (target.confused==0){
    move_score=move_score+30;
} else {
    if (skill>TrainerAI.MEDIUM){
        if (move.value==0){
            move_score=move_score-90;
        }
    }
}

return move_score;
