/// @description  double baim_trap(move id, user, target, skill, move score);
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

if (target.trapped_for==0){
    move_score=move_score+40;
}

return move_score;
