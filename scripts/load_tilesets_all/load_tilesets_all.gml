/// @description  void load_tilesets_full(buffer, version);
/// @param buffer
/// @param  version

var version = argument1;

var embedded_tilesets = buffer_read(argument0, buffer_u8);
var n_tilesets = buffer_read(argument0, buffer_u16);

World.all_tilesets = array_create(n_tilesets);

for (var i = 0; i < n_tilesets; i++){
    // this doubles as the picture file . . . i think
    var ts_name = buffer_read(argument0, buffer_string);
    
    var sprite = buffer_read_sprite(argument0);
    
    var n_autotiles = buffer_read(argument0, buffer_u8);
    var at_array = array_create(n_autotiles);
    var at_passage = array_create(n_autotiles);
    var at_priority = array_create(n_autotiles);
    var at_flags = array_create(n_autotiles);
    var at_tags = array_create(n_autotiles);
    
    for (var j = 0; j < n_autotiles; j++){
        // s16 because no tile is "noone"
        at_array[j] = buffer_read(argument0, buffer_s16);
        at_passage[j] = buffer_read(argument0, buffer_u8);
        at_priority[j] = buffer_read(argument0, buffer_u8);
        at_flags[j] = buffer_read(argument0, buffer_u8);
        at_tags[j] = buffer_read(argument0, buffer_u8);
    }
    
    var t_grid_width = buffer_read(argument0, buffer_u16);
    var t_grid_height = buffer_read(argument0, buffer_u16);
    
    var t_grid_passage = ds_grid_create(t_grid_width, t_grid_height);
    var t_grid_priority = ds_grid_create(t_grid_width, t_grid_height);
    var t_grid_flags = ds_grid_create(t_grid_width, t_grid_height);
    var t_grid_tags = ds_grid_create(t_grid_width, t_grid_height);
    
    // the way i did this is a little weird and i don't know why - the grids
    // (and autotile arrays, for that matter) already exist so there's no point
    // in recreating them, so just populate their values instead
    
    for (var j = 0; j < t_grid_width; j++){
        for (var k = 0; k < t_grid_height; k++){
            t_grid_passage[# j, k] = buffer_read(argument0, buffer_u8);
            t_grid_priority[# j, k] = buffer_read(argument0, buffer_u8);
            t_grid_flags[# j, k] = buffer_read(argument0, buffer_u8);
            t_grid_tags[# j, k] = buffer_read(argument0, buffer_u8);
        }
    }
    
    var ts = tileset_create(ts_name, t_grid_passage, t_grid_priority, t_grid_flags, t_grid_tags,
        at_array, at_passage, at_priority, at_flags, at_tags, sprite);
    
    World.all_tilesets[i] = ts;
}
