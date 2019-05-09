/// @description  double baim_user_heal_half(move id, user, target, skill, move score);
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

var f=pokemon_hp_f(user);
if (f==1){
    move_score=move_score-90;
} else {
    move_score=move_score-100*f
}

return move_score;
