/// @description  BattlePokemon add_trainer_pokemon(species, level, [item], [moves], [ability], [gender], [form], [shiny?], [nature], [ivs], [evs], [happiness], [name], [shadow?], [ball]);
/// @param species
/// @param  level
/// @param  [item]
/// @param  [moves]
/// @param  [ability]
/// @param  [gender]
/// @param  [form]
/// @param  [shiny?]
/// @param  [nature]
/// @param  [ivs]
/// @param  [evs]
/// @param  [happiness]
/// @param  [name]
/// @param  [shadow?]
/// @param  [ball]
//                                    0        1      2       3        4          5         6       7         8         9      10     11           12      13         14
with (instance_create(0, 0, BattlePokemon)){
    var base=get_pokemon(argument[0]);

    name=base.name;
    species=argument[0];
    experience=get_experience(argument[1], base.growth_rate);
    
    // We determine the moves here because they might get overwritten depending on what arguments you get...
    pokemon_auto_moves(id);
    
    // some other default settings that are based upon the species
    default_ability=irandom(ds_list_size(base.abilities)-1);
    ability=get_ability(default_ability);
    happiness=base.happiness;
    
    if (base.gender==-1){
        gender=Genders.GENDERLESS;
    } else {
        if (random(1)<base.gender){
            gender=Genders.FEMALE;
        } else {
            gender=Genders.MALE;
        }
    }
    
    switch (argument_count){
        case 15:
            ball_type=argument[14];
        case 14:
            shadow=argument[13];
        case 13:
            name=argument[12];
        case 12:
            happiness=argument[11];
        // there is no bounds checking on ivs/evs. if you assign an array of size, say, 4, and later
        // the game crashes when you try to access array[5], that's your problem.
        case 11:
            evs=argument[10];
        case 10:
            ivs=argument[9];
        case 9:
            nature=argument[8];
        case 8:
            shiny=argument[7];
        case 7:
            form=argument[6];
        case 6:
            gender=argument[5];
        case 5:
            // you can pass -2 as the ability parameter to select a random hidden
            // ability, if the base pokémon has one
            if (argument[4]==-1){
                default_ability=irandom(ds_list_size(base.abilities)-1);
                ability=get_ability(base.abilities[| default_ability]);
            } else if (argument[4]==-2){
                default_ability=irandom(ds_list_size(base.hidden_abilities)-1);
                ability=get_ability(base.hidden_abilities[| default_ability]);
            } else {
                default_ability=argument[4];
                if (argument[4]<ds_list_size(base.abilities)){
                    ability=get_ability(base.abilities[| argument[4]]);
                // no bounds checking on hidden abilities, once again, if this crashes the game
                // that's your problem
                } else {
                    ability=get_ability(base.hidden_abilities[| argument[4]-ds_list_size(base.abilities)]);
                }
            }
        case 4:
            var move_array=argument[3];
            var n=min(array_length_1d(move_array), MOVE_LIMIT);
            // loop through the move array. if any of them are valid moves,
            // assign the move array to the pokémon and that's that.
            for (var i=0; i<n i++){
                if (move_array[i]>-1){
                    array_clear(moves, -1);
                    // this isn't actually a nested loop since the outer one
                    // terminates after the inner one runs
                    for (var k=0; k<n; k++){
                        pokemon_teach_move(id, move_array[k], k);
                    }
                    break;
                }
            }
        case 3:
            item=argument[2];
            break;
    }
    
    // ...but calculate the stats down here because they depend on the IVs/EVs
    // that might get passed in.
    pokemon_auto_stats(id);
    
    heal(id);
    
    return id;
}
