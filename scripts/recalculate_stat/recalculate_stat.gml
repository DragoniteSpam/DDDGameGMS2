/// @description  int recalculate_stat(BattlePokemon, stat);
/// @param BattlePokemon
/// @param  stat

var base=get_pokemon(argument0.species).base_stat[argument1];
var iv=argument0.ivs[argument1];
var ev=argument0.evs[argument1];
var level=get_pokemon_level(argument0);

if (argument1==Stats.HP){
    return floor((base*2+iv+floor(ev/4))*level/100)+level+10;
}

return floor((floor((base*2+iv+floor(ev/4))*level/100)+5)*get_nature_modifier(argument0.nature, argument1));
