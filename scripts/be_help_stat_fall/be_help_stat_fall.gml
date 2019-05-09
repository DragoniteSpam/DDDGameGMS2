// be_help_stat_fall(queue, BattlePokemon);

// this should only be called within the instance_create of one of the other
// be_ scripts.

if (Battle.misc_data[? "stat fall animations"]==0){
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_stat_change_animation, argument1, ba_stat_change, spr_anim_stat_fall, 0, 64, se_battle_decrease));
}
Battle.misc_data[? "stat fall animations"]++;
