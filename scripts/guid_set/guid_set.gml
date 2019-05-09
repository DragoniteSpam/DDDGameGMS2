/// @description  void guid_set(Data, value);
/// @param Data
/// @param  value
// you're assuming you're allowed to do this without checking here,
// since hopefully you know it's valid when you save the data file

ds_map_add(World.all_guids, argument1, argument0);
argument0.GUID=argument1;
