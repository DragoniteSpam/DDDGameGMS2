/// @description  double baim_user_speed_raise_1(move id, user, target, skill, move score);
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

// todo +40 if used on the first turn; the author of the Essentials AI has pointed out that
// people like Dragon Dance. if you implement this you probably want to either (a) break it
// up between this and baim_user_attack_raise_1 or add a special ai script to case $26 in
// pbs_move_read_ai_code because that code is specific to dragon dance and dragon dance-like
// moves, and this script is not.

if (move.value==0){
    if (!pokemon_can_raise_stat(user, Stats.SPEED)){
        move_score=move_score-90;
    } else {
        move_score=move_score-user.mods[Stats.SPEED]*20;
    }
} else {
    if (user.moves[Stats.SPEED]<0){
        move_score=move_score+20;
    }
}

return move_score;
