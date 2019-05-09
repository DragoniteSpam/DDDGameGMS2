/// @description  DataType add_type(name, is special?, color, total types, pbs internal name);
/// @param name
/// @param  is special?
/// @param  color
/// @param  total types
/// @param  pbs internal name

with (instance_create(0, 0, DataType)){
    name=argument0;
    special=argument1;
    color=argument2;
    on=array_create(argument3);
    array_clear(on, 1);
    
    pbs_internal_name=argument4;
    
    return id;
}
