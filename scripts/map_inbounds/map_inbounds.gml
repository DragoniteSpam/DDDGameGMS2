/// @description  boolean map_inbounds(DataMap, xx, yy, zz);
/// @param DataMap
/// @param  xx
/// @param  yy
/// @param  zz

return is_clamped(argument1, 0, argument0.xx-1)&&is_clamped(argument2, 0, argument0.yy-1)&&is_clamped(argument3, 0, argument0.zz-1);
