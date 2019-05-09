/// @description  void load_data_parse_items(all blobs);
/// @param all blobs
// this could be done in load_data_instances, and it would probably
// be way more straightforward that way, but i draw the line at script
// hugeness somewhere around there

var property_map=load_data_parse_properties(Database.data_type_array[Database.item]);

var blob=argument0[Database.item];
var n_instances=ds_grid_width(blob);

Database.all_items=array_create(n_instances);
for (var i=0; i<n_instances; i++){
    var data=add_item(blob[# i, 0],
        blob[# i, property_map[? "Plural"]],
        blob[# i, property_map[? "Pocket"]],
        blob[# i, property_map[? "Cost"]],
        null,                                   // overworld use script
        null,                                   // battle use script
        null,                                   // special use script
        blob[# i, property_map[? "Value"]],
        ItemAIFlags.NONE,                       // AI flags
        blob[# i, property_map[? "Summary"]],
        blob[# i, 0]
    );
    
    data.equip_slot=blob[# i, property_map[? "WeaponType"]];
    data.mod_atk=blob[# i, property_map[? "StatModAtk"]];
    data.mod_def=blob[# i, property_map[? "StatModDef"]];
    data.mod_agl=blob[# i, property_map[? "StatModAgl"]];
    
    data.flags=blob[# i, 1];
    guid_set(data, blob[# i, 2]);
    Database.all_items[i]=data;
}

ds_grid_destroy(blob);
ds_map_destroy(property_map);
