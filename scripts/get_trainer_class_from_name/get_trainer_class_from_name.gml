/// @description  int get_trainer_class_from_name(name, [use internal name?]);
/// @param name
/// @param  [use internal name?]

switch (argument_count){
    case 2:
        return get_generic_from_name(World.all_trainer_classes, argument[0], argument[1]);
}

return get_generic_from_name(World.all_trainer_classes, argument[0]);
