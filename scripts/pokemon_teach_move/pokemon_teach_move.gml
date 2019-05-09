/// @description  void pokemon_teach_move(BattlePokemon, move index, slot);
/// @param BattlePokemon
/// @param  move index
/// @param  slot
// unless you want to update the previous moves list each time
// you modify the moves array, this should be the ONLY way that
// the move array is modified (not counting the pokemon_auto_moves
// script, since that sets things up slightly differently).

if (ds_list_find_index(argument0.previous_moves, argument0.moves[argument2])!=-1){
    ds_list_add(argument0.previous_moves, argument0.moves[argument2]);
}

if (World.settings.gameplay.tms_infinite_use&&argument0.moves[argument2]!=-1){
    // if tms are infinite use, you don't want players to be able
    // to restore pp for free by replacing and relearning tms
    argument0.move_pp[argument2]=min(get_move(argument1).pp, argument0.move_pp[argument2]);
} else {
    argument0.move_pp[argument2]=get_move(argument1).pp;
}

argument0.moves[argument2]=argument1;
argument0.move_pp_up[argument2]=0;
