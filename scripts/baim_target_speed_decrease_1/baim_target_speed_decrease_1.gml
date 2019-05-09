/// @description  double baim_target_speed_decrease_1(move id, user, target, skill, move score);
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
    if (!pokemon_can_lower_stat(target, Stats.SPEED)){
        move_score=move_score-90;
    } else {
        move_score=move_score+target.mods[Stats.SPEED]*10;
        if (skill>=TrainerAI.HIGH){
            var user_speed=pokemon_calculated_stat(user, Stats.SPEED);
            var target_speed=pokemon_calculated_stat(target, Stats.SPEED);
            if (user_speed<target_speed&&user_speed*2>target_speed){
                move_score=move_score+30;
            }
        }
    }
} else {
    if (target.mods[Stats.SPEED]>0){
        move_score=move_score+20;
    }
}

return move_score;
