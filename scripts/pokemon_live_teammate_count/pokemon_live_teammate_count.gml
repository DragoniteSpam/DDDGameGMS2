/// @description  int pokemon_live_teammate_count(BattlePokemon);
/// @param BattlePokemon

var party=argument0.owner.party;
var t=0;

for (var i=0; i<ds_list_size(party); i++){
    if (alive(party[| i])&&party[| i]!=argument0){
        t++;
    }
}

return t;
