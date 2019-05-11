/// @description  DataTileset tileset_create(picture file, passage, priority, flags, tags, autotiles[], at passage[], at priority[], at flags[], at tags[]);
/// @param name/filename
/// @param  passage
/// @param  priority
/// @param  flags
/// @param  tags
/// @param  autotiles[]
/// @param  atpassage[]
/// @param  atpriority[]
/// @param  atflags[]
/// @param  attags[]
/// @param [sprite]
// this differs from the version in the editor because it takes all parameters immediately

// don't instantiate these outside of this script
with (instance_create(0, 0, DataTileset)){
    picture_name = argument[0];
    if (file_exists(PATH_TILESET + argument[0])){
        picture = sprite_add(PATH_TILESET + argument[0], 0, false, false, 0, 0);
    } else if (argument_count > 10){
        picture = argument[10];
    } else {
        show_error("tileset: no supplied picture and no file found for \"" + argument[0] + "\", please fix that", true);
    }
    
    
    // these should be indices in World.available_autotiles, not the
    // sprite asset itself!
    
    passage = argument[1];
    priority = argument[2];
    flags = argument[3];
    tags = argument[4];
    
    autotiles = argument[5];
    
    at_passage = argument[6];
    at_priority = argument[7];
    at_flags = argument[8];
    at_tags = argument[9];
    
    var n_autotiles=array_length_1d(autotiles);
    
    autotile_positions = array_create(n_autotiles);
    autotile_sizes = array_create(n_autotiles);
    for (var i = 0; i < n_autotiles; i++){
        // i don't know what these values mean but they were working in the editor so NO TOUCH
        autotile_positions[i] = vector2(0.5 + (i div (n_autotiles / 2)) * 0.25, (i mod (n_autotiles / 2)) / 16);
        autotile_sizes[i] = vector2(32 / TEXTURE_SIZE, 32 / TEXTURE_SIZE);
    }
    
    master = tileset_create_master(id);
    texture = sprite_get_texture(master, 0);
    
    return id;
}
