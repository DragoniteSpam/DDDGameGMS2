/// @description  double match_cardinal_direction(angle, magnitude, dir);
/// @param angle
/// @param  magnitude
/// @param  dir
// there's probably a constant-time way to do this but i don't
// really care enough to spend time finding it

if (argument0<0){
    return false;
}

if (abs(argument1)<0.2){
    return false;
}

if (is_clamped(argument0, argument2-45, argument2+45)){
    return true;
}

if (argument2-45<0){
    if (is_clamped(argument0, argument2+315, argument2+405)){
        return true;
    }
}

return false;
