/// @description  DataAbility add_ability(name, summary, internal name);
/// @param name
/// @param  summary
/// @param  internal name
// there may be some move flags and stuff added later

// todo when it comes time to ACTUALLY load abilities from
// a file, it may be a good idea to pass a map of keys/values
// to this script and have the script set values like 'can
// escape' and 'status acceptance' based on what it finds
// in the map
with (instance_create(0, 0, DataAbility)){
    name=argument0;
    summary=argument1;
    
    pbs_internal_name=argument2;
    
    return id;
}
