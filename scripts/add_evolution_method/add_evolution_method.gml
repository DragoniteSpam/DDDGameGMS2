/// @description  void add_evolution_method(name, script, pbs internal name);
/// @param name
/// @param  script
/// @param  pbs internal name

with (instance_create(0, 0, DataEvolutionMethod)){
    name=argument0;
    script=argument1;
    pbs_internal_name=argument2;
    
    return id;
}
