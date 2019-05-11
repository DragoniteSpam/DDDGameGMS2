/// @description  void load_datadata(buffer, version);
/// @param buffer
/// @param  version

// we want to be able to pull out the datatypes in any order, by name, and not
// be concerned with the order that they were read out
var data_type_map=ds_map_create/*<name, index>*/();

var n_datadata=buffer_read(argument0, buffer_u16);
Database.data_type_array=array_create(n_datadata);

for (var i=0; i<n_datadata; i++){
    var data=instance_create(0, 0, DataData);
    
    var bools=buffer_read(argument0, buffer_u8);
    data.is_enum=unpack(bools, 0);
    //var deleted=unpack(bools, 1);                                 // not useful here - just ignore later
    
    load_generic(argument0, data, argument1);
    buffer_read(argument0, buffer_string);                          // summary
    
    var n_properties=buffer_read(argument0, buffer_u16);
    data.properties=array_create(n_properties);
    
    for (var j=0; j<n_properties; j++){
        var name=buffer_read(argument0, buffer_string);
        buffer_read(argument0, buffer_u32);                         // flags
        var guid=buffer_read(argument0, buffer_u32);
        
        buffer_read(argument0, buffer_u8);                          // property bools
        
        if (data.is_enum){
            // nothing special was saved
            data.properties[j]=array_compose(name, guid);
        } else {
            var dtype=buffer_read(argument0, buffer_u8);
            buffer_read(argument0, buffer_f32);                     // range min
            buffer_read(argument0, buffer_f32);                     // range max
            buffer_read(argument0, buffer_u8);                      // number scale
            buffer_read(argument0, buffer_u16);                     // char limit
            buffer_read(argument0, buffer_u32);                     // type guid - the developer should already know this
            
            switch (dtype){
                case DataTypes.INT:
                        var btype=buffer_s32;
                        break;
                    case DataTypes.ENUM:
                    case DataTypes.DATA:
                        var btype=buffer_u32;
                        break;
                    case DataTypes.FLOAT:
                        var btype=buffer_f32;
                        break;
                    case DataTypes.STRING:
                        var btype=buffer_string;
                        break;
                    case DataTypes.BOOL:
                        var btype=buffer_u8;
                        break;
            }
            
            data.properties[j]=array_compose(name, guid, btype);
        }
    }
    
    Database.data_type_array[i]=data;
    ds_map_add(data_type_map, data.name, i);
}

// these are indices in the array
Database.attack=data_type_map[? "Attack"];
Database.class=data_type_map[? "Class"];
Database.e_damage_type=data_type_map[? "EDamageType"];
Database.element=data_type_map[? "Element"];
Database.item=data_type_map[? "Item"];
Database.item_pocket=data_type_map[? "ItemPocket"];
Database.weapon_style=data_type_map[? "WeaponStyle"];
Database.weapon_type=data_type_map[? "WeaponType"];

// this can probably be removed in production, or at least commented out, but since
// these values being undefined in the data file has a way of screwing things up in
// unexpected ways down the line i'd prefer to check them here before doing anything else

var err_string = "";

if (Database.attack == undefined){
    err_string = err_string + "Attack\n";
}
if (Database.class == undefined){
    err_string = err_string + "Class\n";
}
if (Database.e_damage_type == undefined){
    err_string = err_string + "EDamageType\n";
}
if (Database.element == undefined){
    err_string = err_string + "Element\n";
}
if (Database.item == undefined){
    err_string = err_string + "Item\n";
}
if (Database.item_pocket == undefined){
    err_string = err_string + "ItemPocket\n";
}
if (Database.weapon_style == undefined){
    err_string = err_string + "WeaponStyle\n";
}
if (Database.weapon_type == undefined){
    err_string = err_string + "WeaponType\n";
}

if (string_length(err_string) > 0){
    show_error("Required data type(s) not found:\n" + err_string +"Please add them to the data file and try again.", true);
    exit;
}

ds_map_destroy(data_type_map);

enum DataTypes {
    INT,
    ENUM,
    FLOAT,
    STRING,
    BOOL,
    DATA
}
