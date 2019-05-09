/// @description  boolean map_get_solid(DataMap, xx, yy, zz);
/// @param DataMap
/// @param  xx
/// @param  yy
/// @param  zz
// Does not check to see if the specified coordinates are in bounds.
// You are responsible for that.

if (!map_inbounds(argument0, argument1, argument2, argument3)){
    return true;
}

// you could use map_get_at but that does a few extra steps that we
// don't need and this is just two lines anyway
var slice=argument0.contents[# argument1, argument2];
var cell=slice[argument3];

if (cell==noone){
    return false;
}

for (var i=0; i<ds_list_size(cell); i++){
    if (cell[| i].am_solid){
        return true;
    }
}

return false;
