/// @description  Entity map_add_static(DataMap, Entity, [xx, yy, zz]);
/// @param DataMap
/// @param  Entity
/// @param  [xx
/// @param  yy
/// @param  zz]
// Does not check to see if the specified coordinates are in bounds.
// You are responsible for that.

if (argument_count>2){
    argument[1].xx=argument[2];
    argument[1].yy=argument[3];
    argument[1].zz=argument[4];
    argument[1].target_xx=argument[2];
    argument[1].target_yy=argument[3];
    argument[1].target_zz=argument[4];
    argument[1].previous_xx=argument[2];
    argument[1].previous_yy=argument[3];
    argument[1].previous_zz=argument[4];
}

map_add_contents(argument[0], argument[1], argument[1].xx, argument[1].yy, argument[1].zz);

ds_list_add(argument[0].list_static, argument[1]);

return argument[1];
