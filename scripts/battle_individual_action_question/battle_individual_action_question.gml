/// @description  void battle_individual_action_question(params);
/// @param params
// 0: text

// this is a yes or a no. it works the same way as a multiple choice
// but it presets the options to yes and no.

var params=argument0;

question(params[| 0], L("Yes"), 0, L("No"), 1);
