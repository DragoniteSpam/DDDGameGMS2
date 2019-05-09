/// @description  map load_data_parse_properties(datadata);
/// @param datadata

var property_map=ds_map_create();

for (var i=0; i<array_length_1d(argument0.properties); i++){
    var property=argument0.properties[i];
    // the first three are reserved for name, flags, guid
    ds_map_add(property_map, property[0], i+3);
}

return property_map;
