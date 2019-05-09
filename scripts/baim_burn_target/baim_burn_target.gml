/// @description  double baim_burn_target(move id, user, target, skill, move score);
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

if (pokemon_can_have_status(target, MajorStatus.BURN)){
    move_score=move_score+30;
    if (skill>TrainerAI.MEDIUM){
        // if you're messing with this you may wish to do an HP check similar
        // to the one in baim_poison_target, but the default Essentials AI
        // doesn't seem to do it so I won't here
    }
    if (skill>TrainerAI.HIGH){
        // todo -40 if target has guts, marvel scale, quick feet or flare
        // boost
    }
} else {
    if (skill>TrainerAI.MEDIUM){
        if (move.value==0){
            move_score=move_score-90;
        }
    }
}

return move_score;
