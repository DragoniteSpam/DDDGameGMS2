/// @description  double math_mod(BattlePokemon, Stat);
/// @param BattlePokemon
/// @param  Stat

if (argument0.owner.team.double_stat[argument1]>0){
    var team_mod=2;
} else {
    var team_mod=1;
}

return power((2+abs(argument0.mods[argument1]))/2, sign(argument0.mods[argument1]))*team_mod;
