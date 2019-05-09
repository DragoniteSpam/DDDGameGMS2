/// @description  int get_evolution_method_from_name(name, [use internal name?]);
/// @param name
/// @param  [use internal name?]

switch (argument_count){
    case 2:
        return get_generic_from_name(World.all_evolution_methods, argument[0], argument[1]);
}

return get_generic_from_name(World.all_evolution_methods, argument[0]);
