/// @description  list battle_get_valid_targets(user, move index=-1);
/// @param user
/// @param  move index=-1
// note: this returns a list of battlefield positions, not BattlePokemon,
// as it did originally. you want a move to target a position, not an individual,
// in the case that the individual switches out before the move lands.

var move_target=MoveTargets.ALLOPPONENTS;

switch (argument_count){
    case 2:
        move_target=get_move(argument[1]).target;
        break;
}

var valid_targets=ds_list_create();

switch (move_target){
    case MoveTargets.USER:
        // that was easy
        ds_list_add(valid_targets, argument[0].position);
        break;
    default:
        // todo not all moves have the same targeting abilities but for now we assume
        // that they do, except for self-moves
        for (var i=0; i<ds_list_size(Battle.contestants); i++){
            // i don't understand why this line is here. there's no reason
            // you can't hit your teammates.
            //if (Battle.contestants[| i].owner!=argument0.owner){
            // you generally cannot, however, hit yourself.
            if (i!=argument[0].position){
                ds_list_add(valid_targets, i);
            }
        }
        break;
}

return valid_targets;
