/// @description  void load_data_parse_classes(all blobs);
/// @param all blobs

var property_map=load_data_parse_properties(Database.data_type_array[Database.class]);

var blob=argument0[Database.class];
var n_instances=ds_grid_width(blob);

Database.all_classes=array_create(n_instances);
for (var i=0; i<n_instances; i++){
    var data=instance_create(0, 0, DataClass);
    
    data.name=blob[# i, 0];
    data.flags=blob[# i, 1];
    guid_set(data, blob[# i, 2]);
    
    data.damage_type0=blob[# i, property_map[? "DamageType1"]];
    data.damage_type1=blob[# i, property_map[? "DamageType0"]];
    data.def_weapon_type=blob[# i, property_map[? "DefWeaponType"]];
    data.element0=blob[# i, property_map[? "Element0"]];
    data.element1=blob[# i, property_map[? "Element1"]];
    data.race=blob[# i, property_map[? "Race"]];
    data.summary=blob[# i, property_map[? "Summary"]];
    
    Database.all_classes[i]=data;
}

ds_grid_destroy(blob);
ds_map_destroy(property_map);
