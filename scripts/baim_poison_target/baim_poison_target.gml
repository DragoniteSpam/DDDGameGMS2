/// @description  double baim_poison_target(move id, user, target, skill, move score);
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

if (pokemon_can_have_status(target, MajorStatus.POISON)){
    move_score=move_score+30;
    // the following conditions are not exclusive. if they all pass, the move
    // score for these moves (and others that can induce status) can go quite
    // high.
    if (skill>TrainerAI.MEDIUM){
        if (pokemon_hp_f(target)<0.25){
            move_score=move_score+30;
        }
        if (pokemon_hp_f(target)<0.125){
            move_score=move_score+50;
        }
        // todo -40 if target has had Yawn used on them
    }
    if (skill>TrainerAI.HIGH){
        // these feels like arbitrary thresholds to me but it's in the default
        // Essentials AI and i don't want to mess with it
        if (pokemon_calculated_stat(target, Stats.DEFENSE)>100){
            move_score=move_score+10;
        }
        if (pokemon_calculated_stat(target, Stats.SPDEFENSE)>100){
            move_score=move_score+10;
        }
        // todo -40 if target has guts, marvel scale or toxic boost
    }
} else {
    if (skill>TrainerAI.MEDIUM){
        if (move.value==0){
            move_score=move_score-90;
        }
    }
}

return move_score;
