// pixels to move
var slide_dist_x=user.offscreen_x-user.battle_x;
var slide_dist_y=user.offscreen_y-user.battle_y;
// alpha per second
var fade_rate=1;
// units per second
var slide_rate=60;
// how long the slide takes
var transition_time=user.distance/slide_rate;
// other timestamps
var still_time=transition_time+0.25;
var fade_time=still_time+user.fade_time;

if (t<transition_time){
    user.x=user.x+slide_dist_x*World.dt/transition_time;
    user.y=user.y+slide_dist_y*World.dt/transition_time;
} else if (t<still_time){
    // pause
} else if (t<fade_time){
    user.alpha=user.alpha-1/fade_rate*World.dt;
} else {
    user.alpha=0;
    instance_destroy(/*self*/);
    Battle.input_ready=true;
    battle_advance();
}

t=t+World.dt;
