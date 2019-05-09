/// @description  void battle_individual_action_set_major_status(params);
/// @param params
// this does not check to see if the pokémon can actually be status'd,
// it just applies it.
// 0: user
// 1: MajorStatus
// 2: [status turn]

var params=argument0;

params[| 0].status=params[| 1];
if (ds_list_size(params)>2){
    params[| 0].status_turn=params[| 2];
}

// todo whenever the BattleDrawable.sprite_index gets set to the trainer's
// sprite, or something else, the color needs to be reset to white and re-
// applied later unless you want to end up with a poisoned or paralyzed
// NPC Trainer
Battle.drawables[| params[| 0].position].color=World.major_status_colors[params[| 1]];

battle_advance();
