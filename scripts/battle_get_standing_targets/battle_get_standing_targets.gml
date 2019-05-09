/// @description  boolean battle_get_standing_targets(move, user, targets);
/// @param move
/// @param  user
/// @param  targets
// this isn't used for any calculations, but it does tell the game if
// any of the move's targets are still alive when it lands.

var move=argument0;
var user=argument1;

for (var i=0; i<ds_list_size(argument2); i++){
    if (alive(Battle.contestants[| argument2[| i]])){
        return true;
    }
}

return false;
