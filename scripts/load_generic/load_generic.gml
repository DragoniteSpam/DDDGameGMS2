/// @description  load_generic(buffer, Struct, version);
/// @param buffer
/// @param  Struct
/// @param  version

var what=argument1;
var version=argument2;

var name=buffer_read(argument0, buffer_string)
var flags=buffer_read(argument0, buffer_u32);
var guid=buffer_read(argument0, buffer_u32);

if (what!=noone){
    argument1.name=name;
    argument1.flags=flags;
    guid_set(argument1, guid);
}
