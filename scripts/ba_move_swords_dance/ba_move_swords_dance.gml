/// @description  void ba_move_swords_dance();

// self moves don't need to check for animating targets
var continue_now=false;

var t_dance=1.6;    // this is how long the sound effect is
var t_wait=t_dance+0.25;

var sword_count=6;
var sword_distance=16;
var sword_height=24;
var sword_rotation_rate=180;    // degrees per second
var sword_scale=0.3;

if (t<t_dance){
    var draw=Battle.drawables[| user.position];
    var anglef=360/sword_count;
    if (!ds_map_exists(misc_data, "setup")){
        // the fade timestamps that get passed to the effect
        var t_fadein=0.1;
        var t_still=t_dance-0.1;
        var t_fadeout=t_dance;
        for (var i=0; i<sword_count; i++){
            var tx=draw.x+sword_distance*dcos(i*anglef);
            var ty=draw.y-sword_distance*dsin(i*anglef);
            var tz=draw.z+sword_height;
            misc_data[? "sword "+string(i)]=new_effect_world(tx, ty, tz, 0, 0, point_direction(draw.x, draw.y, tx, ty), sword_scale,
                spr_anim_move_swords_dance, e3d_generic, t_fadein, t_still, t_fadeout, 1, 1, 0, c_white, 0);
        }
        audio_play_sound(se_move_swords_dance, 1, false);
        misc_data[? "setup"]=true;
    }
    for (var i=0; i<sword_count; i++){
        var effect=misc_data[? "sword "+string(i)];
        var dir=point_direction(draw.x, draw.y, effect.x, effect.y)+sword_rotation_rate*World.dt;
        effect.x=draw.x+sword_distance*dcos(dir);
        effect.y=draw.y-sword_distance*dsin(dir);
    }
} else if (t<t_wait){
    // wait    
} else {
    instance_destroy(/*self*/);
    Battle.input_ready=true;
    battle_advance();
}

t=t+World.dt;
