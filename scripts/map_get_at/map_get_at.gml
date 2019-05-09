/// @description  list map_get_at(DataMap, xx, yy, zz);
/// @param DataMap
/// @param  xx
/// @param  yy
/// @param  zz
// Does not check to see if the specified coordinates are in bounds.
// You are responsible for that.

if (!map_inbounds(argument0, argument1, argument2, argument3)){
    return noone;
}

var slice=argument0.contents[# argument1, argument2];
return slice[argument3];
