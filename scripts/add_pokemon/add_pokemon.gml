/// @description  DataPokemon add_pokemon(name, types, base stats, gender rate, growth rate, base exp, ev rewards, catch rate, happiness, abilities, hidden abilities, moves, egg moves, egg groups, egg steps, height, weight, color, shape, habitat, regional indices, kind, evolutions, wild item distribution, form  name, incense, summary, pbs internal name);
/// @param name
/// @param  types
/// @param  base stats
/// @param  gender rate
/// @param  growth rate
/// @param  base exp
/// @param  ev rewards
/// @param  catch rate
/// @param  happiness
/// @param  abilities
/// @param  hidden abilities
/// @param  moves
/// @param  egg moves
/// @param  egg groups
/// @param  egg steps
/// @param  height
/// @param  weight
/// @param  color
/// @param  shape
/// @param  habitat
/// @param  regional indices
/// @param  kind
/// @param  evolutions
/// @param  wild item distribution
/// @param  form  name
/// @param  incense
/// @param  summary
/// @param  pbs internal name
//                          0     1      2           3            4            5         6           7           8          9          10                11     12         13          14         15      16      17     18     19       20                21    22          23                      24          25       26       27

with (instance_create(0, 0, DataPokemon)){
    name=argument[0];
    
    var arr=argument[1];
    for (var i=0; i<array_length_1d(arr); i++){
        ds_list_add(types, arr[i]);
    }
    
    arr=argument[2];
    for (var i=0; i<array_length_1d(arr); i++){
        base_stat[i]=arr[i];
    }
    
    gender=argument[3];
    growth_rate=argument[4];
    reward_exp=argument[5];
    
    arr=argument[6];
    for (var i=0; i<array_length_1d(arr); i++){
        reward_ev[i]=arr[i];
    }
    
    catch_rate=argument[7];
    happiness=argument[8];
    
    arr=argument[9];
    for (var i=0; i<array_length_1d(arr); i++){
        ds_list_add(abilities, arr[i]);
    }
    
    arr=argument[10];
    for (var i=0; i<array_length_1d(arr); i++){
        ds_list_add(hidden_abilities, arr[i]);
    }
    
    // this needs to be a 2D array of [n, move index] and [n, move level]
    arr=argument[11];
    for (var i=0; i<array_height_2d(arr); i++){
        ds_list_add(moves, arr[i, 0]);
        ds_list_add(move_levels, arr[i, 1]);
    }
    
    arr=argument[12];
    for (var i=0; i<array_length_1d(arr); i++){
        ds_list_add(egg_moves, arr[i]);
    }
    
    arr=argument[13];
    for (var i=0; i<array_length_1d(arr); i++){
        ds_list_add(egg_groups, arr[i]);
    }
    
    egg_steps=argument[14];
    height=argument[15];
    weight=argument[16];
    color=argument[17];
    shape=argument[18];
    habitat=argument[19];
    
    arr=argument[20];
    for (var i=0; i<array_length_1d(arr); i++){
        ds_list_add(indices, arr[i]);
    }
    
    kind=argument[21];
    
    // similar to moves, this needs to be a 2D array of [n, target], [n, type], [n, parameter]
    // this will most likely never be called from the pbs script because you need to have the targets
    // defiend first, which the pbs does not
    arr=argument[22];
    add_pokemon_add_evolutions(self, arr);
    
    // this overwrites the other array but that's okay because garbate collection, probably
    wild_items=argument[23];
    
    // ideally you don't change these
    form_name=argument[24];
    forms[? argument[24]]=id;
    
    incense=argument[25];
    
    summary=argument[26];
    pbs_internal_name=argument[27];
    
    return id;
}
