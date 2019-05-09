var text_list=ds_list_create();
var item_list=ds_list_create();

var list=get_trainer(Battle.input_processing.owner.trainer_index).items[argument0];
for (var i=0; i<ds_list_size(list); i++){
    var stack=list[| i];
    if (stack.count>1){
        ds_list_add(text_list, L("%0 x %1", get_item(stack.index).name, stack.count));
    } else {
        ds_list_add(text_list, L("%0", get_item(stack.index).name));
    }
    ds_list_add(item_list, stack.index);
}

ds_list_add(text_list, L("(Back)"));

var max_n=ds_list_size(text_list);

// todo if you play for reasonably long you're probably going to
// accumulate enough items to make the list overflow the screen,
// so it would be a really good idea to make this list scrollable
// at some point in the future
draw_menu_from_list(text_list, World.message_option_index);
World.message_option_index=menu_input(World.message_option_index, max_n);

var continue_message="";

if (Controller.release_a){
    if (World.message_option_index==max_n-1){
        battle_input_processing_reset(false, BattleInputStages.ITEM);
    } else {
        var item=get_item(item_list[| World.message_option_index]);
        switch (item.battle){
            case ItemBattleUsability.NOPE:
            case ItemBattleUsability.UNKNOWN:
                message(L("%0 can't be used in battle!", item.name));
                break;
            case ItemBattleUsability.POKEMON:
                Battle.misc_data[? "item to use"]=item_list[| World.message_option_index];
                battle_input_processing_reset(false, BattleInputStages.ITEM_POKEMON);
                break;
            case ItemBattleUsability.BALL:
                // you need to select a target if multiple valid targetes exist,
                // but this isn't useful in a trainer battle anyway
                message(L("We haven't implemented this type of battle item yet!"));
                break;
            case ItemBattleUsability.TRAINER:
                // takes the user, because we probably need the information
                // about them/their owner, and the item index, because we
                // probably need to at least gets its name for output messages
                // don't consume the item here, though, do that when it's
                // processed in battle_round_action_execute, because if the
                // action gets interrupted (foe fleeing or trainer forfeit)
                // you'd lose the item anyway
                var output=script_execute(item.battle_use_from_bag, Battle.input_processing, item_list[| World.message_option_index]);
                
                if (output!=noone){
                    battle_prioritize(output);
                    battle_input_processing_reset();
                    continue_message=Battle.input_processing.owner.name+" has chosen to use a(n) "+get_item(item).name;
                }
                break;
        }
    }
} else if (Controller.release_b){
    battle_input_processing_reset(false, BattleInputStages.ITEM);
}

ds_list_destroy(text_list);
ds_list_destroy(item_list);

if (string_length(continue_message)>0){
    battle_debug(continue_message);
}
