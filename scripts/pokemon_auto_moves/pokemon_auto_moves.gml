/// @description  void pokemon_auto_moves(BattlePokemon);
/// @param BattlePokemon

var base=get_pokemon(argument0.species);
var l=get_pokemon_level(argument0);

var n=ds_list_size(base.moves)-1;
var count=0;

while (n>=0){
    if (base.move_levels[| n]<=l){
        if (count<MOVE_LIMIT){
            argument0.move_pp[count]=get_move(base.moves[| n]).pp;
            argument0.move_pp_up[count]=0;
            argument0.moves[count++]=base.moves[| n];
        } else {
            ds_list_add(argument0.previous_moves, base.moves[| n]);
        }
    }
    n--;
}
