/// @description  boolean battle_is_on_field(BattlePokemon);
/// @param BattlePokemon

for (var i=0; i<ds_list_size(Battle.contestants); i++){
    if (Battle.contestants[| i]==argument0){
        return true;
    }
}

return false;
