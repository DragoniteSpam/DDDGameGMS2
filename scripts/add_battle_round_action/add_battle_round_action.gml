/// @description  BattleRoundAction add_battle_round_action(script, param0 .. paramn);
/// @param script
/// @param  param0 .. paramn

with (instance_create(0, 0, BattleRoundAction)){
    script=argument[0];
    for (var i=1; i<argument_count; i++){
        ds_list_add(params, argument[i]);
    }
    return id;
}
