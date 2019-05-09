/// @description  double get_stick_magnitude(r, u);
/// @param r
/// @param  u

if (abs(argument0)<0.1&&abs(argument1)<0.1){
    return 0;
}

return sqrt(argument0*argument0+argument1*argument1);
