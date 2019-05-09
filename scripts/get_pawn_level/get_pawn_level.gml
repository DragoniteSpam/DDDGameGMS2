/// @description  double get_pawn_level(Pawn);
/// @param Pawn

var maximal=1;
for (var i=0; i<ds_list_size(argument0.party); i++){
    var test=argument0.party[| i];
    maximal=max(maximal, get_level(test.experience, get_pokemon(test.species).growth_rate));
}

return maximal;
