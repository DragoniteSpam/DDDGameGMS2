/// @description  double estimated_accuracy(DataMove, user, target);
/// @param DataMove
/// @param  user
/// @param  target
// todo this doesn't account for most edge cases (Stomp,
// Compoundeyes, thart sort of thing) but should do that
// eventually

var move=argument0;
var user=argument1;
var target=argument2;

if (move.accuracy==0){
    return 1;
}

return min(1, move.accuracy*math_mod(user, Stats.ACCURACY)/math_mod(target, Stats.EVADE)/100);
