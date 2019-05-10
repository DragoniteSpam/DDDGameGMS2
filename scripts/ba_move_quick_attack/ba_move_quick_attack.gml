/// @description  void ba_move_quick_attack();

var continue_now=true;
for (var i=0; i<ds_list_size(target_list); i++){
    if (Battle.contestants[| target_list[| i]].animate_on){
        continue_now=false;
        break;
    }
}

var t_wait=0.1;
var t_advance=t_wait+0.35;
var t_wait_2=t_advance+0.25;
var t_terminate=t_wait_2+0.25;

var advance_speed=60;
var retract_speed=60;
var midpoint=BATTLEFIELD_SIZE/2;

var circle_rate=360/0.35;
var user_draw=Battle.drawables[| user.position];
var circle_radius=8;
var circle_x=user_draw.battle_x+circle_radius*dcos(180+user_draw.center_direction);
var circle_y=user_draw.battle_y-circle_radius*dsin(180+user_draw.center_direction);

var particle_count=16;
var particle_color=merge_color(c_yellow, c_white, 0.5);
var particle_scale=0.75;
var particle_speed_min=64;
var particle_speed_max=192;
var particle_speed_damping=1;

if (t<t_wait){
    // wait
} else if (t<t_advance){
    var dir=point_direction(circle_x, circle_y, user_draw.x, user_draw.y)-circle_rate*World.dt;
    user_draw.x=circle_x+circle_radius*dcos(dir);
    user_draw.y=circle_y-circle_radius*dsin(dir);
} else if (t<t_wait_2){
    user_draw.x=user_draw.battle_x;
    user_draw.y=user_draw.battle_y;
    if (!ds_map_exists(misc_data, "hit")){
        for (var i=0; i<ds_list_size(target_list); i++){
            // fade timestamps
            var t_fadein=0;
            var t_still=t_fadein+0.5;
            var t_fadeout=t_still+0.25;
            // other stuff
            var draw=Battle.drawables[| target_list[| i]];
            var f=0.35;
            var relative_z=sprite_get_height(draw.sprite_index)*f*draw.scale*draw.yscale;
            var position=world_to_2d(draw.x, draw.y, draw.z+relative_z);
            for (var j=0; j<particle_count; j++){
                var pxsp=random_range(particle_speed_min, particle_speed_max)*choose(-1, 1);
                var pysp=random_range(particle_speed_min, particle_speed_max)*choose(-1, 1);
                new_effect_2d(position[vec2.xx], position[vec2.yy], spr_part_sphere, e2d_generic, t_fadein, t_still, t_fadeout,
                    particle_scale, particle_scale, 0, particle_color, 0, 0, false, pxsp, pysp, particle_speed_damping);
            }
        }
        audio_play_sound(se_hit, 1, false);
        misc_data[? "hit"]=true;
    }
    // otherwise wait
} else if (t<t_terminate){
    // wait some more
} else {
    continue_now=true;
}

if (continue_now){
    instance_destroy(/*self*/);
    Battle.input_ready=true;
    battle_advance();
}

t=t+World.dt;
