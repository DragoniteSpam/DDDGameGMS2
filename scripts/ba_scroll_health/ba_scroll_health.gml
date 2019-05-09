var clear_time=1;   // the amount of time it should take the hp bar to fully empty
var amount=misc_data[? "amount"];           // the amount of hp that has to scroll

var delta_f=get_progress_bar_scroll_rate(clear_time, amount, user.act[Stats.HP]);
var scroll_time=get_progress_bar_scroll_time(clear_time, amount, user.act[Stats.HP]);

if (t<scroll_time&&is_clamped(user.act_hp, 0, user.act[Stats.HP])){
    // because math, the change in HP may overshoot the target amount for
    // some values. this check makes sure that doesn't happen. it doesn't
    // matter if it's a little lower than the actually correct amount because
    // at the end it's set to that exactly anyway.
    if (abs(misc_data[? "initial"]-user.act_hp+delta_f)<abs(amount)){
        user.act_hp=max(0, user.act_hp-delta_f);
    }
} else {
    // this will hopefully be the correct value but just in case there's
    // floating point imprecision or something
    user.act_hp=max(0, floor(misc_data[? "initial"]-amount));
    instance_destroy(/*self*/);
    Battle.input_ready=true;
    battle_advance();
}

t=t+World.dt;
