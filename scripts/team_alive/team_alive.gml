/// @description  boolean team_alive(BattleTeam);
/// @param BattleTeam

for (var i=0; i<ds_list_size(argument0.owner.party); i++){
    if (alive(argument0.owner.party[| i])){
        return true;
    }
}

return false;
