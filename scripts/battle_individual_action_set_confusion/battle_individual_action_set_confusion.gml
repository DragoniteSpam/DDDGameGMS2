/// @description  void battle_individual_action_set_confusion(params);
/// @param params
// 0: target
// 1: turns

var params=argument0;

// we need to add one to the confusion turns because the counter
// ticks down and then does the check. if it's set to 1, it'll
// immediately tick down to zero and the contestant won't ever
// get a chance to hit themself in confusion.
params[| 0].confused=params[| 1]+1;

battle_advance();
