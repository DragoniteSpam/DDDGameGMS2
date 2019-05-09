/// @description  sprite get_pokemon_battle_sprite(BattlePokemon, side);
/// @param BattlePokemon
/// @param  side

enum SpriteSides {
    FRONT,
    BACK
}

// todo stuff here based on gender, shiny, form and maybe a few other things

switch (argument1){
    case SpriteSides.FRONT:
        return argument0.spr_front;
    case SpriteSides.BACK:
        return argument0.spr_back;
}
