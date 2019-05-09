/// @description  void array_clear_2d(array, value);
/// @param array
/// @param  value

for (var i=0; i<array_height_2d(argument0); i++){
    for (var j=0; j<array_length_2d(argument0, i); j++){
        argument0[@ i, j]=argument1;
    }
}
