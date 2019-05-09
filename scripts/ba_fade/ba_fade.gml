var t_animation=misc_data[? "time"];
var fade_rate=1/t_animation;

if (t<t_animation){
    if (misc_data[? "starting"]>0.5){
        var rate=-fade_rate*World.dt;
    } else {
        var rate=fade_rate*World.dt;
    }
    user.alpha=user.alpha+rate;
} else {
    // this is a non-terminating effect so we have to do this here
    instance_destroy(user);
    instance_destroy(/*self*/);
    Battle.input_ready=true;
    battle_advance();
}

t=t+World.dt;
