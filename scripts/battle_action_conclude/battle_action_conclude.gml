switch (Battle.result){
    case BattleStatus.CONTINUE:
        message("congratulations you broke the battle loop");
        break;
    case BattleStatus.WIN:
        var fade_time=0.5;
        var victorious=noone;
        var losers=ds_list_create();
        for (var i=0; i<ds_list_size(Battle.teams); i++){
            if (Battle.debug_win==noone){
                for (var j=0; j<ds_list_size(Battle.teams[| i].owner.party); j++){
                    if (alive(Battle.teams[| i].owner.party[| j])){
                        victorious=Battle.teams[| i].owner;
                        continue;
                    }
                }
            } else {
                victorious=Battle.debug_win;
            }
            if (victorious!=Battle.teams[| i].owner){
                ds_list_add(losers, Battle.teams[| i].owner);
            }
        }
        var loser_names="";
        for (var i=0; i<ds_list_size(losers); i++){
            loser_names=loser_names+losers[| i].name;
            if (i<ds_list_size(losers)-2){
                loser_names=loser_names+", ";
            } else if (i<ds_list_size(losers)-1){
                loser_names=loser_names+L(" and ");
            }
        }
        ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_round_action_text, L("%0 has defeated %1!", victorious.name, loser_names)));
        if (victorious==Camera.following){
            var reward=0;
            for (var i=0; i<ds_list_size(losers); i++){
                reward=reward+get_prize_money(losers[| i]);
            }
            ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_round_action_text, L("Was given $%0 as prize money!", reward)));
            // todo: if not wild pokémon, trainer(s) move back on screen and display their 'trainer lose' text
            ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_fade, c_black, fade_time, 0));
            ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_end, true));
        } else {
            var reward=min(Camera.following.money, get_prize_money(Camera.following));
            // you can't go into debt, unless you want to implement a hard mode or something
            if (reward>0){
                // i don't like instanceof but the alternative would be writing a lot of code,
                // most of which will probably never be used
                if (instanceof(victorious, PawnWild)){
                    var loss_message=L("%0 dropped %1 in panic!", Camera.following.name, reward);
                } else {
                    var loss_message=L("%0 handed out %1 to the winner!", Camera.following.name, reward);
                }
                ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_round_action_text, loss_message));
                Camera.following.money=Camera.following.money-reward;
            }
            // todo: if not wild pokémon, trainer(s) move back on screen and display their 'trainer win' text
            ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_round_action_text, L("%0 zonked out!", Camera.following.name)));
            ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_fade, c_black, fade_time, 0));
            ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_end, false));
            ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_individual_action_wait, 0.25, true));
        }
        break;
    case BattleStatus.DRAW:
        ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_round_action_text, L("The battle ended in a draw...")));
        break;
}
