/// @description  void load_data_instances(buffer, version);
/// @param buffer
/// @param  version

var t=get_timer();

var version=argument1;

var n_datadata=array_length_1d(Database.data_type_array);
var all_blobs=array_create(n_datadata);

for (var i=0; i<n_datadata; i++){
    var datadata=Database.data_type_array[i];
    
    if (datadata.is_enum){
        // enums don't get instantiated
    } else {
        var n_properties=array_length_1d(datadata.properties);
        var n_instances=buffer_read(argument0, buffer_u16);
        datadata.instances=array_create(n_instances);
        
        // grid because arrays in game maker SUUUUUUUUUCK
        var blob_grid=ds_grid_create(n_instances, n_properties+3);
        
        for (var j=0; j<n_instances; j++){
            blob_grid[# j, 0]=buffer_read(argument0, buffer_string)
            blob_grid[# j, 1]=buffer_read(argument0, buffer_u32);
            blob_grid[# j, 2]=buffer_read(argument0, buffer_u32);
            
            for (var k=0; k<n_properties; k++){
                // [name, guid, data type]
                var property=datadata.properties[k];
                blob_grid[# j, k+3]=buffer_read(argument0, property[2]);
            }
        }
        
        all_blobs[i] = blob_grid;
    }
}

load_data_parse_attacks(all_blobs);
load_data_parse_classes(all_blobs);
load_data_parse_e_damage_types(all_blobs);
load_data_parse_elements(all_blobs);
load_data_parse_items(all_blobs);
load_data_parse_item_pockets(all_blobs);
load_data_parse_weapon_styles(all_blobs);
load_data_parse_weapon_types(all_blobs);

debug("loading generic data took "+string((get_timer()-t)/MILLION)+" seconds.");
