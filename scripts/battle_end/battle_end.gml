/// @description  void battle_end(params);
/// @param params
// 0: true if the outcome is favoriable, false if it is not

var params=argument0;

// put all of the battlers back to sleep so that they don't waste cpu cycles
// when the game returns to the overworld

for (var i=0; i<ds_list_size(Battle.teams); i++){
    for (var j=0; j<ds_list_size(Battle.teams[| i].owner.party); j++){
        instance_deactivate_object(Battle.teams[| i].owner.party[| j]);
    }
}

// continue: ideally the game returns control to the overworld after this
// is finished executing

// for now we just end the game
show_message(L("That's the battle loop! Hopefully at some point in the future there will be an overworld to return to or something. For now the game is just going to close."));
game_end();
