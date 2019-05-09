/// @description  void contents_add_single(DataMap, Entity, xx, yy, zz);
/// @param DataMap
/// @param  Entity
/// @param  xx
/// @param  yy
/// @param  zz
// Does not check to see if the specified coordinates are in bounds.
// You are responsible for that.

var slice=argument0.contents[# argument2, argument3];
var cell=slice[argument4];

if (cell==noone){
    cell=ds_list_create();
    slice[@ argument4]=cell;
}

ds_list_add(cell, argument1);
