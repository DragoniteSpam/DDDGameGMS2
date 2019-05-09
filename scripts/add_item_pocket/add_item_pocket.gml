/// @description  DataItemPocket add_item_pocket(name, color, icon, sound effect);
/// @param name
/// @param  color
/// @param  icon
/// @param  sound effect

with (instance_create(0, 0, DataItemPocket)){
    name=argument0;
    color=argument1;
    icon=argument2;
    se=argument3;
    
    return id;
}
