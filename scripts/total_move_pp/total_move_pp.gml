/// @description  int total_pp(BattlePokemon, index);
/// @param BattlePokemon
/// @param  index

if (argument0.moves[argument1]==-1){
    return 0;
}

return get_move(argument0.moves[argument1]).pp*(1+0.2*argument0.move_pp_up[argument1]);
