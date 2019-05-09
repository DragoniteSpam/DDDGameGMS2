/// @description  void battle_input_processing_control_switch_item();

if (Controller.release_a){
    if (World.message_option_index==ds_list_size(Battle.input_processing.owner.party)){
        battle_input_processing_reset(false, BattleInputStages.ITEM_INTERNAL);
    } else {
        var pkmn=Battle.input_processing.owner.party[| World.message_option_index];
        var item=Battle.misc_data[? "item to use"];
        
        var output=script_execute(get_item(item).battle_use_from_bag, pkmn, item);
        
        if (output!=noone){
            battle_prioritize(output);
            battle_input_processing_reset();
            // todo IN MULTI BATTLES you need to mark the item as "in use"
            // so you can't use it more than once on the same turn, for both
            // you and the ai.
            battle_debug(pkmn.owner.name+" has chosen to use a(n) "+get_item(item).name);
        }
    }
} else if (Controller.release_b){
    battle_input_processing_reset(false, BattleInputStages.ITEM_INTERNAL);
}
