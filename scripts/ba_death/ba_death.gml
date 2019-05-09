var t_animation=1;
var t_wait=t_animation+0.15;

var drop_rate=sprite_get_height(user.sprite_index)/t_animation*World.dt;

if (t<t_animation){
    user.z=user.z-drop_rate;
} else if (t<t_wait){
    // wait
} else {
    instance_destroy(/*self*/);
    Battle.input_ready=true;
    battle_advance();
}

t=t+World.dt;
