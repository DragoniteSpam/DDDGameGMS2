/// @description  void load_event_custom(buffer, version);
/// @param buffer
/// @param  version

var n_custom = buffer_read(argument0, buffer_u16);

World.all_event_custom = array_create(n_custom);

for (var i = 0; i < n_custom; i++){
    var custom = instance_create(0, 0, DataEventNodeCustom);
    load_generic(argument0, custom, argument1);
    
    var n_types = buffer_read(argument0, buffer_u8);
    custom.types = array_create(n_types);
    
    for (var j = 0; j < n_types; j++){
        var name = buffer_read(argument0, buffer_string);
        var type = buffer_read(argument0, buffer_u8);
        var datadata = buffer_read(argument0, buffer_u32);
        var max_size = buffer_read(argument0, buffer_u8);
        var required = buffer_read(argument0, buffer_u8);
        
        custom.types[j] = [name, type, datadata, max_size, required];
    }
    
    World.all_event_custom[i] = custom;
}
