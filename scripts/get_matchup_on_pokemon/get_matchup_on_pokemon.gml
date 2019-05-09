/// @description  double get_matchup_on_pokemon(user, target);
/// @param user
/// @param  target
// checks for the general type effectiveness of user on target.
// may or may not be useful, since users don't necessariliy have
// moves that are all of their own type.

var user=argument0;
var target=argument1;

var t=1;

for (var i=0; i<ds_list_size(user.types); i++){
    for (var j=0; j<ds_list_size(target.types); j++){
        t=t*get_matchup(user.types[| i], target.types[| j]);
    }
}

return t;
