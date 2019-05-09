/// @description  double ds_list_max_width(list);
/// @param list
// this depends on having the correct font set. be careful.

var winner=0;

for (var i=0; i<ds_list_size(argument0); i++){
    winner=max(winner, string_width(string_hash_to_newline(string(argument0[| i]))));
}

return winner;
