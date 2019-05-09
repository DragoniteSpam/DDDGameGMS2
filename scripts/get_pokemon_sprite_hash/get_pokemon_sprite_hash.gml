/// @description  sprite get_pokemon_sprite_hash(BattlePokemon, side, [ignore female?]);
/// @param BattlePokemon
/// @param  side
/// @param  [ignore female?]

var ignore_female=false;
switch (argument_count){
    case 3:
        ignore_female=argument[2];
    default:
        break;
}

// todo stuff here based on gender, shiny, form and maybe a few other things

var name=string_pad(argument[0].species+1, 3);
if (!ignore_female&&argument[0].gender==Genders.FEMALE){
    name=name+"f";
}
if (argument[0].shiny){
    name=name+"s";
}
if (argument[1]==SpriteSides.BACK){
    name=name+"b";
}

if (argument[0].form>0){
    name=name+"_"+string(argument[0].form);
}

// if the sprite file exists, return it
if (file_exists(PATH_BATTLER+name+".png")){
    return name;
} else if (ignore_female){
    debug("found neither female nor default sprite for: "+get_pokemon(argument[0].species).name+" shiny="+World.tf[argument[0].shiny]+
        " front="+World.tf[argument[1]==SpriteSides.FRONT]+" form="+string(argument[0].form));
    return "";
}

// if the pokémon you're checking for doesn't have an alternate female sprite,
// return the version with the 'f' in it
return get_pokemon_sprite_hash(argument[0], argument[1], true);
