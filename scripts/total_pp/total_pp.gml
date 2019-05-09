/// @description  int total_pp(BattlePokemon);
/// @param BattlePokemon

var t=0;
for (var i=0; i<array_length_1d(argument0.moves); i++){
    if (argument0.moves[i]!=-1){
        t=t+argument0.move_pp[i];
    }
}

return t;
