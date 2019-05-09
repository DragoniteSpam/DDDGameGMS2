/// @description  boolean pokemon_can_escape(BattlePokemon);
/// @param BattlePokemon

if (argument0.trapped_for>0){
    return false;
}

for (var i=0; i<ds_list_size(Battle.contestants); i++){
    if (Battle.contestants[| i].owner.team!=argument0.owner.team){
        if (!script_execute(Battle.contestants[| i].ability.can_escape, argument0)){
            return false;
        }
    }
}

return true;
