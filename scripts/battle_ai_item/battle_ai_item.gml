/// @description  int battle_ai_item(BattlePokemon);
/// @param BattlePokemon

var user=argument0;
var skill=max(TrainerAI.MINIMUM, get_trainer_class(get_trainer(user.owner.trainer_index).class).ai);
var result=noone;

// todo break if the battle rules disallow items (multiplayer, or more probably the Battle Frontier)

if (alive(user)/* todo &&!user.embargo*/){
    if (pawn_item_total(user.owner)>0){
        var inventory=get_trainer(user.owner.trainer_index).items;
        // if you really want to you could check every item, or at least
        // Medicine and Berries. i don't.
        var medicine=inventory[ItemPockets.MEDICINE];
        for (var i=0; i<ds_list_size(medicine); i++){
            var base_item=get_item(medicine[| i].index);
            var use_me=false;
            if (item_get_flag(base_item, ItemAIFlags.HEAL_HP)){
                var missing=user.act[Stats.HP]-user.act_hp;
                var f=pokemon_hp_f(user);
                if (base_item.value==-1){
                    if (f<0.25){
                        use_me=true;
                    }
                    if (f<0.5&&random(10)<3){
                        use_me=true;
                    }
                } else {
                    if (missing>=base_item.value*3/4){
                        use_me=true;
                    } else if (missing>=base_item.value*0.5&&random(10)<3){
                        use_me=true;
                    }
                }
            } // endif potion
            if (item_get_flag(base_item, ItemAIFlags.HEAL_SELECT_STATUS)){
                if (base_item.value==get_status_class(user)){
                    use_me=true;
                }
            } // endif antidote
            if (item_get_flag(base_item, ItemAIFlags.HEAL_ALL_STATUS)){
                // this can apparently lead to weird situations such as
                // the ai dropping a Full Restore to heal confusion at
                // full health
                if (user.status!=MajorStatus.NONE||user.confused){
                    use_me=true;
                }
            } // endif full heal
            if (item_get_flag(base_item, ItemAIFlags.BUFF)){
                if (random(10)<3-user.mods[base_item.value]){
                    use_me=true;
                }
            } // endif xattack
            
            if (use_me){
                result=add_battle_executable_action(BattleActions.ITEM, user, noone, medicine[| i].index);
                break;
            }
        }
    }
}

return result;
