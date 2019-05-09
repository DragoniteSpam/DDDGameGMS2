/// @description  void load_data_parse_elements(all blobs);
/// @param all blobs

var property_map=load_data_parse_properties(Database.data_type_array[Database.element]);

var blob=argument0[Database.element];
var n_instances=ds_grid_width(blob);

Database.all_elements=array_create(n_instances);
for (var i=0; i<n_instances; i++){
    var data=add_type(blob[# i, 0],
        false,                                  // is special?
        c_black,                                // color
        n_instances,                            // total types
        blob[# i, 0]                            // internal name
    );
    
    data.flags=blob[# i, 1];
    guid_set(data, blob[# i, 2]);
    Database.all_elements[i]=data;
}

ds_grid_destroy(blob);
ds_map_destroy(property_map);
