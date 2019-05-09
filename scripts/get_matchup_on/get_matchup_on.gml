/// @description  double get_matchup_on(type, target, [applied effects list], [user]);
/// @param type
/// @param  target
/// @param  [applied effects list]
/// @param  [user]

var user=noone;
var effects_list=noone;

switch (argument_count){
    case 4:
        // todo some pokémon have abilities that may bypass certain type
        // checks, i.e. Mold Breaker and probably some other things
        user=argument[3];
    case 3:
        // todo this may become important for some effects that mess with
        // type, i.e. Flying Press and whatever
        effects_list=argument[2];
        break;
}

var m=argument[1].ability.damage_from[argument[0]];;

for (var i=0; i<ds_list_size(argument[1].types); i++){
    m=m*get_matchup(argument[0], argument[1].types[| i]);
}

return m;
