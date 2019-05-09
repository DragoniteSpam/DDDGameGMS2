/// @description  void battle_individual_action_level_gain(BattleIndividualAction);
/// @param BattleIndividualAction
// 0: user
// 1. old level
// 2: new level

var params=argument0;
var pkmn=params[| 0];

// todo: ding-ding-ding sound that plays when you learn a new move or
// gain a level

Battle.input_processing=pkmn;
battle_input_processing_reset(false, BattleInputStages.LEVEL_STAT_DELTA);

Battle.misc_data[? "who"]=params[| 0];
Battle.misc_data[? "old level"]=params[| 1];
Battle.misc_data[? "new level"]=params[| 2];

Battle.misc_data[? "old hp"]=pkmn.act[Stats.HP];
Battle.misc_data[? "old atk"]=pkmn.act[Stats.ATTACK];
Battle.misc_data[? "old def"]=pkmn.act[Stats.DEFENSE];
Battle.misc_data[? "old spa"]=pkmn.act[Stats.SPATTACK];
Battle.misc_data[? "old spd"]=pkmn.act[Stats.SPDEFENSE];
Battle.misc_data[? "old spe"]=pkmn.act[Stats.SPEED];

// automatically jump to the highest-available level
var delta_hp=pkmn.act[Stats.HP]-pkmn.act_hp;
params[| 0].experience=get_experience(params[| 2], get_pokemon(pkmn.species).growth_rate);
recalculate_all_stats(pkmn);
pkmn.act_hp=pkmn.act[Stats.HP]-delta_hp;

Battle.misc_data[? "new hp"]=pkmn.act[Stats.HP];
Battle.misc_data[? "new atk"]=pkmn.act[Stats.ATTACK];
Battle.misc_data[? "new def"]=pkmn.act[Stats.DEFENSE];
Battle.misc_data[? "new spa"]=pkmn.act[Stats.SPATTACK];
Battle.misc_data[? "new spd"]=pkmn.act[Stats.SPDEFENSE];
Battle.misc_data[? "new spe"]=pkmn.act[Stats.SPEED];
