/// @description  void battle_fade(params);
/// @param params
// 0: color
// 1: time
// 2: starting alpha

var params=argument0;

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    user=new_effect_2d(0, 0, -1, e2d_overlay_monochrome, params[| 1], params[| 1], params[| 1], 1, 1, 0, params[| 0], params[| 2]);
    misc_data[? "time"]=params[| 1];
    misc_data[? "starting"]=params[| 2];
    script=ba_fade;
}
