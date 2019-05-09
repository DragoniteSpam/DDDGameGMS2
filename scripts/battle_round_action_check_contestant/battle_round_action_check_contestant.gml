/// @description  void battle_round_action_check_contestant(params);
/// @param params
// 0: team index

var team=Battle.teams[| argument0[| 0]];
var found=noone;
var found_index=-1;
var game_over=false;

// todo this is going to get more complicated when you bring ai into it.
// this is going to get even MORE complicated when you bring Zoroark into it,
// because you have to fool the text below into thinking found is not
// a Zoroark.

// not sure what I had the following for. You need to evaluate game over
// regardless of the fainted Pokémon belonging to the player or not. In fact,
// I'm not sure why this wasn't breaking things earlier.
//if (team.owner!=Camera.following&&!DEBUG){
for (var i=0; i<ds_list_size(team.owner.party); i++){
    if (alive(team.owner.party[| i])){
        found_index=i;
        found=team.owner.party[| i];
        break;
    }
}
if (found==noone){
    game_over=true;
}

var pawn_alive=0;
var pawn_slots=0;
// count the number of spaces on the battlefield the battle pawn has
for (var i=0; i<ds_list_size(Battle.teams); i++){
    if (Battle.teams[| i].owner==Camera.following&&Camera.following.sentient){
        pawn_slots++;
    }
}
// count the number of living pokémon the battle pawn has
for (var i=0; i<ds_list_size(Camera.following.party); i++){
    if (alive(Camera.following.party[| i])){
        pawn_alive++;
    }
}

if (game_over){
    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, L("%0 has no more healthy Pokémon!", team.name)));
} else {
    if (team.owner==Camera.following&&Camera.following.sentient/*||DEBUG*/){
        // todo when this happens in wild battles, you should have the opportunity to flee
        // todo if you enable forfeiting (or debug auto-win) trainer battles, you should have the opportunity to do that also
        // the 'who do you choose?' text is set in the action
        ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_switch_after_death, argument0[| 0]));
    } else {
        // if you wanted to do multiplayer (which you do not) you would need to bypass
        // this line. actually if you wanted to do multiplayer, this line would be the
        // least of your worries.
        if (World.settings.battle.battle_style_shift){
            // If I recall, you don't get asked to switch in a double battle where you
            // get two slots on the field.
            if (pawn_alive>1&&pawn_slots==1){
                ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_question, L("%0 is about to send in %1. Would you like to change Pokémon?", team.name, found.name)));
                for (var i=0; i<ds_list_size(Battle.contestants); i++){
                    if (Battle.contestants[| i].owner==Camera.following/*||DEBUG*/){
                        ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_switch_before_turn, i));
                    }
                }
            }
        }
        //Battle.contestants[| argument0[| 0]]=found;
        ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_set_replacement, argument0[| 0], found_index));
    }
}

battle_advance();
