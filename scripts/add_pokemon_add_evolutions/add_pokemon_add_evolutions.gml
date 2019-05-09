/// @description  void add_pokemon_add_evolutions(DataPokemon, array);
/// @param DataPokemon
/// @param  array

// we use noone instead of an empty array because creating an empty 2D array is hard.
if (!is_array(argument1)){
    for (var i=0; i<array_height_2d(argument1); i++){
        ds_list_add(argument0.evolutions, add_individual_evolution(argument1[i, 0], argument1[i, 1], argument1[i, 2]));
    }
}
