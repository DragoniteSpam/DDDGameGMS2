/// @description  void load_map_contents_meta(buffer, version);
/// @param buffer
/// @param  version

var version=argument1;

instance_activate_object(DataMap);
instance_destroy(DataMap);

var m_name=buffer_read(argument0, buffer_string);
var m_internal_name=buffer_read(argument0, buffer_string);
var m_summary=buffer_read(argument0, buffer_string);

var xx=buffer_read(argument0, buffer_u16);
var yy=buffer_read(argument0, buffer_u16);
var zz=buffer_read(argument0, buffer_u16);

var m_tileset=buffer_read(argument0, buffer_u8);

var map=add_map(m_name, m_internal_name, m_tileset);
map_construct_grids(map, xx, yy, zz);

if (argument1>=DataVersions.MAP_VARS){
    map.audio_bgm=buffer_read(argument0, buffer_string);
    var n_ambient=buffer_read(argument0, buffer_u16);
    repeat(n_ambient){
        ds_list_add(map.audio_ambient, buffer_read(argument0, buffer_string));
        ds_list_add(map.audio_ambient_frequencies, buffer_read(argument0, buffer_u8));
    }
    
    map.fog_start=buffer_read(argument0, buffer_f32);
    map.fog_end=buffer_read(argument0, buffer_f32);
    
    var bools=buffer_read(argument0, buffer_u32);
    map.indoors=unpack(bools, 0);
    map.draw_water=unpack(bools, 1);
    map.fast_travel_to=unpack(bools, 2);
    map.fast_travel_from=unpack(bools, 3);

    if (argument1>=DataVersions.MAP_3D){
        map.is_3d=unpack(bools, 4);
    }
}
