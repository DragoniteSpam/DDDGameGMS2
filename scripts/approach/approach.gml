/// @description  double approach(initial, target, amount);
/// @param initial
/// @param  target
/// @param  amount

// I wrote this script later on and didn't retroactively
// add it to existing code. There are a few places (particularly
// animations that use delta time) that could benefit it to
// make the code shorter, but don't.
if (argument0==argument1){
    return argument0;
} else if (argument0>argument1){
    return max(argument0-argument2, argument1);
} else {
    return min(argument0+argument2, argument1);
}
