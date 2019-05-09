/// @description  void pokemon_reset_volatile_stat_mods(BattlePokemon);
/// @param BattlePokemon

recalculate_all_stats(argument0);

for (var i=0; i<8; i++){
    argument0.mods[i]=0;
}

ds_list_clear(argument0.types);
argument0.types=ds_list_clone(get_pokemon(argument0.species).types);

argument0.invulnerable_state=InvulnerableStates.NONE;
argument0.invulnerable_move=-1;
argument0.momentum_move=-1;
argument0.momentum_turn=0;
argument0.trapped_by=-1;
argument0.trapped_for=0;
argument0.trapped_residual_damage=0;

argument0.confused=0;
argument0.flinch=false;
argument0.turn_count=0;
argument0.last_move=-1;

// entrapment isn't a volatile status on your part, but on your foes

battle_remove_entrapments(argument0);

// other stuff

argument0.flag_downed=false;
