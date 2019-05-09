/// @description  double bi_damage_mod_electric(user, target, move);
/// @param user
/// @param  target
/// @param  move

var user=argument0;
var target=argument1;
var move=argument2;

if (move.type==Types.ELECTRIC){
    // 1.1 in gens 3 and earlier
    return 1.2;
}

return 1;
