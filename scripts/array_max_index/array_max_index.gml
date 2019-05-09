/// @description  double array_max_index(array);
/// @param array
// same as array_max, but it returns the index of the max value
// instead of the value.

var m=0;

for (var i=0; i<array_length_1d(argument0); i++){
    if (argument0[i]>argument0[m]){
        m=i;
    }
}

return m;
