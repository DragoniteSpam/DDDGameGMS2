/// @description  void contents_remove_single(DataMap, Entity, xx, yy, zz);
/// @param DataMap
/// @param  Entity
/// @param  xx
/// @param  yy
/// @param  zz
// Does not check to see if the specified coordinates are in bounds.
// You are responsible for that.

var slice=argument0.contents[# argument2, argument3]
var cell=slice[argument4];

// if the specified object cannot be found at (x, y, z) the game
// will crash. do not remove solid Entities from locations where
// they cannot be found.

ds_list_delete(cell, ds_list_find_index(cell, argument1));
if (ds_list_size(cell)==0){
    ds_list_destroy(cell);
    slice[@ argument4]=noone;
}
