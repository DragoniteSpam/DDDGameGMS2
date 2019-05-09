var gain=misc_data[? "gain"];
var current=misc_data[? "current"];
var base=get_pokemon(user.species);

var current_level=get_pokemon_level(user);
var current_level_exp=get_experience(current_level, base.growth_rate);
var next_level_exp=get_experience(current_level+1, base.growth_rate);
var difference_exp=next_level_exp-current_level_exp;

if (current+gain>next_level_exp){
    show_error("gained experience would overflow the next level;"+N+
        "you're curretnly not allowed to do that, experience gain"+N+
        " has to be split up through battle_round_action_execute", true);
}

var clear_time=1;   // the amount of time it should take the exp bar to fully fill

var delta_f=get_progress_bar_scroll_rate(clear_time, gain, difference_exp);
var scroll_time=get_progress_bar_scroll_time(clear_time, gain, difference_exp);

// todo sound effects: both the bubbling noise while gaining experience and the
// fanfare if/when you gain a level

// if we hit a level-up, we stop
if (t<scroll_time&&user.experience<current+gain){
    // see comments in ba_scroll_hp
    if (abs(current-user.experience-delta_f)<abs(gain)){
        user.experience=user.experience+delta_f;
    }
} else {
    // cut it off here! don't worry, overflow isn't lost, it's just saved in the command to continue gaining
    // after the level up message has been shown
    // you could make the argument that it would be smarter to do everything here so you don't need to mess
    // with multiple scripts/action commands but then i would make the argument that i want to work with the
    // system that's already been written
    user.experience=current+gain;
    instance_destroy(/*self*/);
    Battle.input_ready=true;
    battle_advance();
}

t=t+World.dt;
