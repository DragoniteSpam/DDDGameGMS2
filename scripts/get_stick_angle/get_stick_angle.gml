/// @description  double get_stick_angle(r, u);
/// @param r
/// @param  u

if (abs(argument0)<0.1&&abs(argument1)<0.1){
    return -1;
}

return point_direction(0, 0, argument0, argument1);
