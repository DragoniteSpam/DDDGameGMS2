/// @description  void load_data_parse_weapon_styles(all blobs);
/// @param all blobs

var property_map=load_data_parse_properties(Database.data_type_array[Database.weapon_style]);

var blob=argument0[Database.weapon_style];
var n_instances=ds_grid_width(blob);

Database.all_weapon_styles=array_create(n_instances);
for (var i=0; i<n_instances; i++){
    var data=instance_create(0, 0, DataWeaponStyle);
    
    data.name=blob[# i, 0];
    data.flags=blob[# i, 1];
    guid_set(data, blob[# i, 2]);
    
    data.weapon_type=blob[# i, property_map[? "WeaponType"]];
    
    Database.all_weapon_styles[i]=data;
}

ds_grid_destroy(blob);
ds_map_destroy(property_map);
