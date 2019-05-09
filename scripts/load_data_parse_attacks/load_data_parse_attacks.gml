/// @description  void load_data_parse_attacks(all blobs);
/// @param all blobs

var property_map=load_data_parse_properties(Database.data_type_array[Database.attack]);

var blob=argument0[Database.attack];
var n_instances=ds_grid_width(blob);

Database.all_attacks=array_create(n_instances);
for (var i=0; i<n_instances; i++){
    var data=add_move(blob[# i, 0],
        blob[# i, property_map[? "Element"]],
        MoveCategories.PHYSICAL,                // now melee, ranged, magic
        5,                                      // PP
        blob[# i, property_map[? "Power"]],
        100,                                    // accuracy
        0,                                      // priority
        MoveTargets.SINGLEOPPONENT,             // target
        blob[# i, 0],                           // summary
        0,                                      // animation
        ARRAY,                                  // effects[]
        ARRAY,                                  // effect odds[]
        0,                                      // flags
        ARRAY,                                  // ai codes[]
        blob[# i, 0]
    );
    
    data.mp_cost=blob[# i, property_map[? "MPCost"]];
    data.sp_cost=blob[# i, property_map[? "SPCost"]];
    data.cooldown=blob[# i, property_map[? "Cooldown"]];
    data.is_combo=blob[# i, property_map[? "IsCombo"]];
    
    data.flags=blob[# i, 1];
    guid_set(data, blob[# i, 2]);
    Database.all_attacks[i]=data;
}

ds_grid_destroy(blob);
ds_map_destroy(property_map);
