/// @description  void battle_round_action_anim_submit_contestant(params);
/// @param params
// 0: drawable index

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    var pkmn=Battle.contestants[| argument0[| 0]];
    user=Battle.drawables[| argument0[| 0]];
    user.alpha=1;
    user.sprite_index=get_pokemon_battle_sprite(pkmn, pkmn.owner.team.sprite_side);
    user.x=user.battle_x;
    user.y=user.battle_y;
    user.z=user.battle_z;
    user.xscale=0;
    user.yscale=0;
    user.scale=POKEMON_GLOBAL_SCALE;
    script=ba_submit_contestant;
}
