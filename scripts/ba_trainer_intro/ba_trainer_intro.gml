var animation_time=1;
var animation_rate=0.08;

if (t<animation_time){
    user.image_index=min(user.image_index+animation_rate, sprite_get_number(user.sprite_index)-1);
} else {
    instance_destroy(/*self*/);
    Battle.input_ready=true;
    battle_advance();
}

t=t+World.dt;
