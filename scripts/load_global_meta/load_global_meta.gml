/// @description  void load_global_meta(buffer, version);
/// @param buffer
/// @param  version

var version=argument1;

var n_maps=buffer_read(argument0, buffer_u16);
World.all_maps=array_create(n_maps);

for (var i=0; i<n_maps; i++){
    World.all_maps[i]=buffer_read(argument0, buffer_string);
}

if (version>=DataVersions.VRAX_REFERENCE){
    var filename=buffer_read(argument0, buffer_string);
    // if one already exists bad things will happen but that won't happen
    // unless i do something wrong or you screw with the editor
    if (ds_exists(World.all_mesh_map, ds_type_map)){
        ds_map_destroy(World.all_mesh_map);
    }
    World.all_mesh_map=const_mesh_load_vrax(filename);
}

if (version>=DataVersions.STARTING_MAP){
    World.game_map_starting = buffer_read(argument0, buffer_string);
    if (string_length(World.game_map_starting) == 0){
        show_error("no starting map defined in data file. you should define a data file.", true);
        exit;
    }
}

if (version>=DataVersions.GAMEPLAY_GRID){
    var bools=buffer_read(argument0, buffer_u32);
    World.game_player_grid=unpack(bools, 0);
}
