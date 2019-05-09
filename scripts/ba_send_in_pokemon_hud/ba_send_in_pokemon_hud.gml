// pixels to move
var slide_rate_x=user.battle_x-user.offscreen_x;
var slide_rate_y=user.battle_y-user.offscreen_y;
// how long the slide takes
var transition_time=0.25;

if (t<transition_time){
    user.x=user.x+slide_rate_x*World.dt/transition_time;
    user.y=user.y-slide_rate_y*World.dt/transition_time;
} else {
    instance_destroy(/*self*/);
    Battle.input_ready=true;
    battle_advance();
}

t=t+World.dt;
