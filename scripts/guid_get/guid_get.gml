/// @description  Data guid_get(guid);
/// @param guid

if (ds_map_exists(World.all_guids, argument0)){
    return World.all_guids[? argument0];
}

return noone;
