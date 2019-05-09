/// @description  int get_generic_from_name(array, name, [use internal name?]);
/// @param array
/// @param  name
/// @param  [use internal name?]

var array=argument[0];
var name=string_minimal(argument[1]);
var use_internal_name=false;

switch (argument_count){
    case 3:
        use_internal_name=argument[2];
    default:
        break;
}

if (use_internal_name){
    for (var i=0; i<array_length_1d(array); i++){
        if (string_minimal(array[i].pbs_internal_name)==name){
            return i;
        }
    }
} else {
    for (var i=0; i<array_length_1d(array); i++){
        if (string_minimal(array[i].name)==name){
            return i;
        }
    }
}

return -1;
