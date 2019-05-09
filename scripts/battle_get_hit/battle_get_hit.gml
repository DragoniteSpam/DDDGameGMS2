/// @description  array battle_get_hit(move, user, targets, effects list);
/// @param move
/// @param  user
/// @param  targets
/// @param  effects list
// todo make an 'overloaded' version of this that doesn't take an effects list

// this may not be useful but it's good information to have i guess
var move=argument0;
var user=argument1;
var output=array_create(ds_list_size(argument2));

if (move.accuracy==0){
    for (var i=0; i<ds_list_size(argument2); i++){
        // i think you might need to do something with this eventually
        var effect=argument3[| i];
        if (effect==noone){
        } else {
        }
        // todo fly, dig, dive
        output[i]=true;
    }
} else {
    for (var i=0; i<ds_list_size(argument2); i++){
        var effect=argument3[| i];
        if (effect==noone){
            var accuracy_base=effect.accuracy_base;
            var accuracy_modifier=effect.accuracy_modifier;
        } else {
            var accuracy_base=0;
            var accuracy_modifier=1;
        }
        // todo fly, dig, dive
        var target=Battle.contestants[| argument2[| i]];
        // todo re-format this so that it uses estimated_accuracy and the
        // output value checks roll < accuracy calculation instead of whatever
        // it checks right now
        var roll=accuracy_base+accuracy_modifier*random_range(0, 100)*math_mod(argument1, Stats.ACCURACY)/math_mod(target, Stats.EVADE);
        output[i]=(roll<move.accuracy);
    }
}

return output;
