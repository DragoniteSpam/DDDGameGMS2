/// @description  DataTileset tileset_create(picture file, passage, priority, flags, tags, autotiles[], at passage[], at priority[], at flags[], at tags[]);
/// @param picture file
/// @param  passage
/// @param  priority
/// @param  flags
/// @param  tags
/// @param  autotiles[]
/// @param  at passage[]
/// @param  at priority[]
/// @param  at flags[]
/// @param  at tags[]
// this differs from the version in the editor because it takes all parameters immediately

// don't instantiate these outside of this script
with (instance_create(0, 0, DataTileset)){
    picture_name=argument0;
    picture=sprite_add(PATH_TILESET+argument0, 0, false, false, 0, 0);
    
    // these should be indices in World.available_autotiles, not the
    // sprite asset itself!
    
    passage=argument1;
    priority=argument2;
    flags=argument3;
    tags=argument4;
    
    autotiles=argument5;
    
    at_passage=argument6;
    at_priority=argument7;
    at_flags=argument8;
    at_tags=argument9;
    
    var n_autotiles=array_length_1d(autotiles);
    
    autotile_positions=array_create(n_autotiles);
    autotile_sizes=array_create(n_autotiles);
    for (var i=0; i<n_autotiles; i++){
        // i don't know what these values mean but they were working in the editor so NO TOUCH
        autotile_positions[i]=vector2(0.5+(i div (n_autotiles/2))*0.25, (i mod (n_autotiles/2))/16);
        autotile_sizes[i]=vector2(32/TEXTURE_SIZE, 32/TEXTURE_SIZE);
    }
    
    master=tileset_create_master(id);
    texture=sprite_get_texture(master, 0);
    
    return id;
}
