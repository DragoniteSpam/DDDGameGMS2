/// @description  boolean has_type(BattlePokemon, type);
/// @param BattlePokemon
/// @param  type

for (var i=0; i<ds_list_size(argument0.types); i++){
    if (argument0.types[| i]==argument1){
        return true;
    }
}

return false;
