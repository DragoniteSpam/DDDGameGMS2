/// @description  double baim_target_sp_defense_decrease_1(move id, user, target, skill, move score);
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

if (move.value==0){
    if (!pokemon_can_lower_stat(target, Stats.SPDEFENSE)){
        move_score=move_score-90;
    } else {
        move_score=move_score+target.mods[Stats.SPDEFENSE]*20;
    }
} else {
    if (target.mods[Stats.SPDEFENSE]>0){
        move_score=move_score+20;
    }
}

return move_score;
