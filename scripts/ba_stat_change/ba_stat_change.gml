var t_mask_fadein=0.2;
var t_mask_animation=t_mask_fadein+0.4;
var t_mask_fadeout=t_mask_animation+0.2;
var t_wait=t_mask_fadeout+0.15;

var mask_speed_x=misc_data[? "mask speed x"];
var mask_speed_y=misc_data[? "mask speed y"];

if (t==0){
    user.mask_script=bm_stat_change;
    user.misc_data[? "mask sprite"]=misc_data[? "mask sprite"];
    user.misc_data[? "mask alpha"]=0;
    user.misc_data[? "mask x"]=0;
    user.misc_data[? "mask y"]=0;
    audio_play_sound(misc_data[? "sound"], 1, false);
} else if (t<t_mask_fadein){
    user.misc_data[? "mask alpha"]=user.misc_data[? "mask alpha"]+World.dt/t_mask_fadein;
} else if (t<t_mask_animation){
} else if (t<t_mask_fadeout){
    user.misc_data[? "mask alpha"]=user.misc_data[? "mask alpha"]-World.dt/t_mask_fadein;
} else if (t<t_wait){
    // wait
} else {
    user.mask_script=null;
    instance_destroy(/*self*/);
    Battle.input_ready=true;
    battle_advance();
}

user.misc_data[? "mask x"]=user.misc_data[? "mask x"]+mask_speed_x*World.dt;
user.misc_data[? "mask y"]=user.misc_data[? "mask y"]+mask_speed_y*World.dt;

t=t+World.dt;
