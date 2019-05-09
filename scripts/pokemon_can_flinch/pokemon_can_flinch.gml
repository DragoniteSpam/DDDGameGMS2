/// @description  boolean pokemon_can_flinch(BattlePokemon);
/// @param BattlePokemon

// i'm pretty sure Inner Focus is the only way to block flinching, but
// if you add more (items, etc), you should apply them here

// oh and you can't flinch if you're behind a substitute

if (!argument0.ability.can_flinch){
    return false;
}

return true;
