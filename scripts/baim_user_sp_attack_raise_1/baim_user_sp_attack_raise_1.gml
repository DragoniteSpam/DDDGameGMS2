/// @description  double baim_user_sp_attack_raise_1(move id, user, target, skill, move score);
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
    if (!pokemon_can_raise_stat(user, Stats.SPATTACK)){
        move_score=move_score-90;
    } else {
        move_score=move_score-user.mods[Stats.ATTACK]*20;
        if (skill>TrainerAI.MEDIUM){
            var has_special_attack=false;
            for (var i=0; i<array_length_1d(user.moves); i++){
                if (user.moves[i]!=-1){
                    var m=get_move(user.moves[i]);
                    if ((m.category==MoveCategories.SPECIAL||m.category==MoveCategories.SPECIAL_ATK_PHYSICAL_DEF)&&m.value>0){
                        has_special_attack=true;
                        break;
                    }
                }
            }
            if (has_special_attack){
                move_score=move_score+20;
            } else if (skill>=TrainerAI.HIGH){
                move_score=move_score-90;
            }
        }
    }
} else {
    if (user.moves[Stats.SPATTACK]<0){
        move_score=move_score+20;
    }
    // this is essentially the same code as in the other half of the if statement
    // but it doesn't discard the move if no other special attacks exist
    if (skill>TrainerAI.MEDIUM){
        var has_special_attack=false;
        for (var i=0; i<array_length_1d(user.moves); i++){
            if (user.moves[i]!=-1){
                var m=get_move(user.moves[i]);
                if ((m.category==MoveCategories.SPECIAL||m.category==MoveCategories.SPECIAL_ATK_PHYSICAL_DEF)&&m.value>0){
                    has_special_attack=true;
                    break;
                }
            }
        }
        if (has_special_attack){
            move_score=move_score+20;
        }
    }
}

return move_score;
