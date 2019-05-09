/// @description  double battle_ai_can_choose_move(user, index);
/// @param user
/// @param  index

var user=argument0;
var index=argument1;

if (user.moves[index]==-1){
    return false;
}

if (user.move_pp[index]==0){
    return false;
}

// todo disable, choice lock, encore, etc
return true;
