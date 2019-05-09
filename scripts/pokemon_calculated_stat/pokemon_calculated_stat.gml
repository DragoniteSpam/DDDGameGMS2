/// @description  int pokemon_calculated_stat(BattlePokemon, Stat);
/// @param BattlePokemon
/// @param  Stat
// this is useful in a couple of places, but not in the actual battle_damage
// script, since there are a few cases where this number will be ignored
// (abilities that bypass stat buffs, critical hits, etc)

return floor(argument0.act[argument1]*math_mod(argument0, argument1));
