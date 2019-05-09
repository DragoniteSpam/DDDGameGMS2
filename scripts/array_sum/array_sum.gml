/// @description  double array_sum(array);
/// @param array
// no type checking. this will most likely crash if you try to sum an
// array with one or more strings in it.

var t=0;
for (var i=0; i<array_length_1d(argument0); i++){
    t=t+argument0[i];
}

return t;
