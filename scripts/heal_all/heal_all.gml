/// @description  void heal_all(Pawn);
/// @param Pawn

for (var i=0; i<ds_list_size(argument0.party); i++){
    heal(argument0.party[| i]);
}
