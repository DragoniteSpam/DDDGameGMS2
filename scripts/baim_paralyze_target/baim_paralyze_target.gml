/// @description  double baim_paralyze_target(move id, user, target, skill, move score);
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

if (pokemon_can_have_status(target, MajorStatus.PARALYZE)){
    // todo gen 6: thunder wave fails if the target is electric type,
    // or so I've been told
    move_score=move_score+30;
    if (skill>TrainerAI.MEDIUM){
        var user_speed=pokemon_calculated_stat(user, Stats.SPEED);
        var target_speed=pokemon_calculated_stat(target, Stats.SPEED);
        if (user_speed>target_speed){
            move_score=move_score+30;
        } else if (target_speed<user_speed){
            move_score=move_score-40;
        }
    }
    if (skill>TrainerAI.HIGH){
        // todo -40 if target has guts, marvel scale or quick feet
    }
} else {
    if (skill>TrainerAI.MEDIUM){
        if (move.value==0){
            move_score=move_score-90;
        }
    }
}

return move_score;
