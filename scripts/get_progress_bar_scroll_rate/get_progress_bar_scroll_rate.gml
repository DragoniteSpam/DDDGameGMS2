/// @description  double get_progress_bar_scroll_rate(clear time, amount, max amount);
/// @param clear time
/// @param  amount
/// @param  max amount
// see also: get_progress_bar_scroll_time

var delta_bar=argument1/argument2;
// this is a measure of time so it has to be positive if you want to get
// the result that you want
var scroll_time=abs(argument0*delta_bar);
var f=argument1/scroll_time;
return f*World.dt;
