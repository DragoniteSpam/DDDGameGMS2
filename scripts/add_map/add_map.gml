/// @description  DataMap add_map(name, internal name, tileset index);
/// @param name
/// @param  internal name
/// @param  tileset index

with (instance_create(0, 0, DataMap)){
    name=argument[0];
    internal_name=argument[1];
    
    tileset=argument[2];
    return id;
}
