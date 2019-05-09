/// @description  void battle_individual_action_stat_change_animation(params);
/// @param params
// 0: user
// 1: script (ba_stat_rise or ba_stat_fall)
// 2: mask sprite
// 3: mask x speed
// 4: mask y speed
// 5: sound effect

var params=argument0;

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    user=Battle.drawables[| params[| 0].position];
    misc_data[? "mask sprite"]=params[| 2];
    misc_data[? "mask speed x"]=params[| 3];
    misc_data[? "mask speed y"]=params[| 4];
    misc_data[? "sound"]=params[| 5];
    script=params[| 1];
}
