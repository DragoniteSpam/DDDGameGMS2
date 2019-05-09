/// @description  array pbs_read_pokemon(filename);
/// @param filename
// the monster PBS is an ini.

ini_open(argument0);

var n=1;
while (ini_section_exists(string(n))){
    n++;
}

var array=array_create(n-2);
array_clear(array, 1);

// a few of the data sets are REALLY LONG and the data is accessed so ridiculously
// frequently which takes a lot of cpu cycles, so we're going to cache it all first

var move_map=ds_map_create();
for (var i=0; i<array_length_1d(all_moves); i++){
    move_map[? all_moves[i].pbs_internal_name]=i;
}

var item_map=ds_map_create();
for (var i=0; i<array_length_1d(all_items); i++){
    item_map[? all_items[i].pbs_internal_name]=i;
}

var ability_map=ds_map_create();
for (var i=0; i<array_length_1d(all_abilities); i++){
    ability_map[? all_abilities[i].pbs_internal_name]=i;
}

var type_map=ds_map_create();
for (var i=0; i<array_length_1d(all_types); i++){
    type_map[? all_types[i].pbs_internal_name]=i;
}

var egg_group_map=ds_map_create();
for (var i=0; i<array_length_1d(all_egg_groups); i++){
    egg_group_map[? all_egg_groups[i].pbs_internal_name]=i;
}

var evolution_method_map=ds_map_create();
for (var i=0; i<array_length_1d(all_evolution_methods); i++){
    evolution_method_map[? all_evolution_methods[i].pbs_internal_name]=i;
}

var pokemon_map=ds_map_create();

// first we need to populate the array of types
for (var i=0; i<n-1; i++){
    var section=string(i+1);
    
    var name=ini_read_string(section, "Name", "Bulbasaur");
    var internal_name=ini_read_string(section, "InternalName", "BULBASAUR");
    // This is slow because it grows an array. But it's used to interpret PBS and if
    // you know what you're doing it won't execute in a shipped game so that's okay.
    // (You could look up the number of types and create the array of that size but
    // honestly that's a lot of work for something this simple.)
    var types=null;
    types[0]=type_map[? ini_read_string(section, "Type1", "NORMAL")];
    // ini_key_exists would be way more elegant but it also appears to take a lot of time
    // also pbs files will only ever have one or two types
    var tt=type_map[? ini_read_string(section, "Type2", "QMARKS")];
    if (tt!=Types.QMARKS){
        types[1]=tt;
    }
    
    var stats=split(ini_read_string(section, "BaseStats", "50,50,50,50,50,50"), ",", true);
    // essentials formats stats like hp/atk/def/spe/spa/spd but i format them
    // like hp/atk/def/spa/spd/spe so we have to do a little work
    array_swap(stats, Stats.SPATTACK, Stats.SPEED);
    
    var gender_string=ini_read_string(section, "GenderRate", "Genderless");
    var gender_rate;
    switch (string_minimal(gender_string)){
        case "alwaysmale":
            gender_rate=0;
            break;
        case "femaleoneeighth":
            gender_rate=0.125;
            break;
        case "female25percent":
            gender_rate=0.25;
            break;
        case "female50percent":
            gender_rate=0.5;
            break;
        case "female75percent":
            gender_rate=0.75;
            break;
        case "femaleseveneighths":
            gender_rate=0.875;
            break;
        case "alwaysfemale":
            gender_rate=1;
            break;
        case "genderless":
        default:
            gender_rate=-1;
            break;
    }
    
    var growth_string=ini_read_string(section, "GrowthRate", "Parabolic");
    var growth_rate;
    switch (string_minimal(growth_string)){
        case "fast":
            growth_rate=GrowthRates.FAST;
            break;
        case "medium":
        case "mediumfast":
            growth_rate=GrowthRates.MEDIUM_FAST;
            break;
        case "slow":
            growth_rate=GrowthRates.SLOW;
        case "parabolic":
        case "mediumslow":
            growth_rate=GrowthRates.MEDIUM_SLOW;
            break;
        case "erratic":
            growth_rate=GrowthRates.ERRATIC;
            break;
        case "fluctuating":
        default:
            growth_rate=GrowthRates.FLUCTUATING;
            break;
    }
    
    var base_exp=ini_read_real(section, "BaseEXP", 50);
    var ev_rewards=split(ini_read_string(section, "EffortPoints", "0,1,0,0,1,0"), ",", true);
    // and again
    array_swap(ev_rewards, Stats.SPATTACK, Stats.SPEED);
    
    var catch_rate=ini_read_real(section, "Rareness", 100);
    var happiness=ini_read_real(section, "Happiness", 70);
    
    var ability_text=split(ini_read_string(section, "Abilities", "SWIFTSWIM"), ",");
    var hidden_ability_text=split(ini_read_string(section, "HiddenAbility", "SWIFTSWIM"), ",");
    var abilities=array_create(array_length_1d(ability_text));
    var hidden_abilities=array_create(array_length_1d(hidden_ability_text));
    for (var j=0; j<array_length_1d(abilities); j++){
        abilities[j]=ability_map[? ability_text[j]];
    }
    for (var j=0; j<array_length_1d(hidden_abilities); j++){
        hidden_abilities[j]=ability_map[? hidden_ability_text[j]];
    }
    
    var move_text=split(ini_read_string(section, "Moves", ""), ",");
    var moves=noone;
    moves[array_length_1d(move_text)/2-1, 1]=0;
    for (var j=0; j<array_height_2d(moves); j++){
        moves[j, 0]=move_map[? move_text[j*2+1]];
        moves[j, 1]=real(move_text[j*2])
    }
    
    var egg_moves_text=split(ini_read_string(section, "EggMoves", ""), ",");
    var egg_moves=array_create(array_length_1d(egg_moves_text));
    for (var j=0; j<array_length_1d(egg_moves); j++){
        egg_moves[j]=move_map[? egg_moves_text[j]];
    }
    
    var egg_group_text=split(ini_read_string(section, "Compatibility", "Undiscovered"), ",");
    var egg_groups=array_create(array_length_1d(egg_group_text));
    for (var j=0; j<array_length_1d(egg_groups); j++){
        egg_groups[j]=egg_group_map[? egg_group_text[j]];
    }
    
    var egg_steps=ini_read_real(section, "StepsToHatch", 6000);
    var height=ini_read_real(section, "Height", 1);
    var weight=ini_read_real(section, "Weight", 10);
    var color=get_color_from_name(ini_read_string(section, "Color", "Blue"));
    
    // you MAY want to make this an enum, too. i don't think it's an especially
    // useful attribute, though, so i'm not going to dedicate resources to it.
    var shape=ini_read_real(section, "Shape", 1);
    
    var habitat_text=ini_read_string(section, "Habitat", "Grassland");
    var habitat;
    switch (string_minimal(habitat_text)){
        case "cave":
            habitat=Habitats.CAVE;
            break;
        case "forest":
            habitat=Habitats.FOREST;
            break;
        case "grassland":
            habitat=Habitats.GRASSLAND;
            break;
        case "mountain":
            habitat=Habitats.MOUNTAIN;
            break;
        case "roughterrain":
            habitat=Habitats.ROUGHTERRAIN;
            break;
        case "sea":
            habitat=Habitats.SEA;
            break;
        case "urban":
            habitat=Habitats.URBAN;
            break;
        case "watersedge":
            habitat=Habitats.WATERSEDGE;
            break;
        case "rare":
        default:
            habitat=Habitats.RARE;
            break;
    }
    
    var regional_indices=split(ini_read_string(section, "RegionalNumbers", "1,1"), ",", true);
    var kind=ini_read_string(section, "Kind", "Seed");
    
    // evolutions are dealt with later
    var evolutions=noone;
    
    var summary=ini_read_string(section, "Pokedex", "the quick brown fox jumped over the lazy dog");
    
    // the way pokémon does wild hold items is 'common' = 50%, 'uncommon' = 5% and 'rare' = 1%
    // UNLESS all three values are the same, in which case the item appears 100% of the time.
    // i decided it doesn't have to be like this and you can have any item distribution that you
    // want (with a resolution of 1/100) but that means that interpreting the pbs data is a bit
    // complicated.
    var wild_item_distribution=array_create(100);
    var wild_item_common=item_map[? ini_read_string(section, "WildItemCommon", "")];
    var wild_item_uncommon=item_map[? ini_read_string(section, "WildItemUncommon", "")];
    var wild_item_rare=item_map[? ini_read_string(section, "WildItemRare", "")];
    if (wild_item_common==wild_item_uncommon==wild_item_rare){
        array_clear(wild_item_distribution, wild_item_common);
    } else {
        array_clear(wild_item_distribution, -1);
        for (var j=0; j<50; j++){
            wild_item_distribution[j]=wild_item_common;
        }
        for (var j=50; j<55; j++){
            wild_item_distribution[j]=wild_item_uncommon;
        }
        wild_item_distribution[55]=wild_item_rare;
    }
    
    var form_name=ini_read_string(section, "FormName", "");
    var incense=item_map[? ini_read_string(section, "Incense", "")];

    array[i]=add_pokemon(name, types, stats, gender_rate, growth_rate, base_exp, ev_rewards, catch_rate, happiness, abilities,
        hidden_abilities, moves, egg_moves, egg_groups, egg_steps, height, weight, color, shape, habitat, regional_indices,
        kind, evolutions, wild_item_distribution, form_name, incense, summary, internal_name);
    
    pokemon_map[? internal_name]=array[i];
}
// after all of the monsters have been created it's safe to set up the evolutions
for (var i=0; i<n-1; i++){
    var section=string(i+1);
    
    var str=ini_read_string(section, "Evolutions", "");    
    if (string_length(str)>0){
        var evolution_text=split(str, ",");
        var evolutions=noone;
        evolutions[array_length_1d(evolution_text)/3, 2]=0;
        for (var j=0; j<array_length_1d(evolution_text); j=j+3){
            evolutions[j, 0]=pokemon_map[? evolution_text[j]];
            evolutions[j, 1]=evolution_method_map[? evolution_text[j+1]];
            // this is another thing that you could make more general but is most likely
            // only going to see use for parsing pbs
            switch (evolutions[j, 1]){
                case EvolutionMethods.TRADEITEM:
                case EvolutionMethods.ITEM:
                case EvolutionMethods.ITEMMALE:
                case EvolutionMethods.ITEMFEMALE:
                case EvolutionMethods.DAYHOLDITEM:
                case EvolutionMethods.NIGHTHOLDITEM:
                    evolutions[j, 2]=item_map[? evolution_text[j+2]];
                    break;
                case EvolutionMethods.HASMOVE:
                    evolutions[j, 2]=move_map[? evolution_text[j+2]];
                    break;
                case EvolutionMethods.HASINPARTY:
                case EvolutionMethods.TRADESPECIES:
                    evolutions[j, 2]=pokemon_map[? evolution_text[j+2]];
                    break;
                case EvolutionMethods.HAPPINESSMOVETYPE:
                    evolutions[j, 2]=type_map[? evolution_text[j+2]];
                    break;
                default:
                    evolutions[j, 2]=real(evolution_text[j+2]);
            }
        }
        add_pokemon_add_evolutions(array[i], evolutions);
    }
}

ini_close();

ds_map_destroy(move_map);
ds_map_destroy(item_map);
ds_map_destroy(ability_map);
ds_map_destroy(pokemon_map);
ds_map_destroy(type_map);
ds_map_destroy(egg_group_map);
ds_map_destroy(evolution_method_map);

return array;
