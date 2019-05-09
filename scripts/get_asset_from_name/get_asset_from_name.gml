/// @description  int get_asset_from_name(array, name);
/// @param array
/// @param  name

var name=string_minimal(argument1);

for (var i=0; i<array_length_1d(argument0); i++){
    if (string_minimal(argument0[i])==name){
        return i;
    }
}

return -1;
