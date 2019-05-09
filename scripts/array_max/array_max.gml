/// @description  double array_max(array);
/// @param array
// this will either not do what you want it to if you pass it an array
// of mixed strings and numbers, or crash it outright

// this should be sufficiently negative
var m=-(1<<32);

for (var i=0; i<array_length_1d(argument0); i++){
    m=max(m, argument0[i]);
}

return m;
