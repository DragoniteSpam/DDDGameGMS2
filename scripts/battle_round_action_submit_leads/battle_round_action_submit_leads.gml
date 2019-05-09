/// @description  void battle_round_action_submit_leads(params);
/// @param params
// 0: team index

var team=Battle.teams[| argument0[| 0]];

// it kind of bugs me that this is sort of the same as
// battle_round_action_change_contestant, since they do pretty much the
// same thing, so i'll probably merge them at some point

// with that in mind, there's no need for pokemon_reset_volatile_stat_mods,
// since that was taken care of when the battle was initialized
message(L("%0 sent out %1!", team.name, team.owner.party[| 0].name));
Battle.contestants[| argument0[| 0]]=team.owner.party[| 0];
Battle.drawables[| argument0[| 0]].color=World.major_status_colors[Battle.contestants[| argument0[| 0]].status];
// this is so each BattlePokemon knows where they are on the field
team.owner.party[| 0].position=argument0[| 0];
