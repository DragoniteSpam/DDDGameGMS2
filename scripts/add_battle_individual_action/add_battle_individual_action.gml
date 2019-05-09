/// @description  BattleIndividualAction add_battle_individual_action(script, param0, .. paramn);
/// @param script
/// @param  param0
/// @param  .. paramn

with (instance_create(0, 0, BattleIndividualAction)){
    script=argument[0];
    for (var i=1; i<argument_count; i++){
        ds_list_add(params, argument[i]);
    }
    return id;
}
