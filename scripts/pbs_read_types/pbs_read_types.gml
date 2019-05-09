/// @description  array pbs_read_types(filename);
/// @param filename
// the type PBS is an ini.

ini_open(argument0);

var n=0;
while (ini_section_exists(string(n))){
    n++;
}

var array;
array[n-1]=1;

array_clear(array, 1);

// first we need to populate the array of types
for (var i=0; i<n; i++){
    var section=string(i);
    var name=ini_read_string(section, "Name", "Normal");
    var internal_name=ini_read_string(section, "InternalName", "NORMAL");
    
    var special=ini_read_boolean(section, "IsSpecialType", "false");
    
    array[i]=add_type(name, special, c_white, n, internal_name);
}

// after all of the types have been created it's safe to random-access
// the DataType.on array
for (var i=0; i<n; i++){
    var section=string(i);
    var weaknesses=split(ini_read_string(section, "Weaknesses", ""), ",");
    var resistances=split(ini_read_string(section, "Resistances", ""), ",");
    var immunities=split(ini_read_string(section, "Immunities", ""), ",");
    
    // type[i] takes 2x damage from type[k]
    for (var j=0; j<array_length_1d(weaknesses); j++){
        for (var k=0; k<n; k++){
            if (weaknesses[j]==array[k].pbs_internal_name){
                array[k].on[i]=TYPE_WEAK;
                break;
            }
        }
    }
    
    // type[i] takes 0.5x damage from type[k]
    for (var j=0; j<array_length_1d(resistances); j++){
        for (var k=0; k<n; k++){
            if (resistances[j]==array[k].pbs_internal_name){
                array[k].on[i]=TYPE_RESISTED;
                break;
            }
        }
    }
    
    // type[i] takes 0x damage from type[k]
    for (var j=0; j<array_length_1d(immunities); j++){
        for (var k=0; k<n; k++){
            if (immunities[j]==array[k].pbs_internal_name){
                array[k].on[i]=TYPE_IMMUNE;
                break;
            }
        }
    }
}

ini_close();

return array;
