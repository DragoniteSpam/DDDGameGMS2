/// @description  void script_begin_custom_add_item(DataEventNode, Entity);
/// @param DataEventNode
/// @param  Entity

var base=guid_get(argument0.custom_guid);

var item_data=argument0.custom_data[| 0];
var quantity_data=argument0.custom_data[| 1];
var silent_data=argument0.custom_data[| 2];

var item=guid_get(item_data[| 0]);
var quantity=quantity_data[| 0];
var silent=silent_data[| 0];

scr_help_add_item(item_data[| 0], quantity);

if (silent){
    script_proceed_custom(argument0, argument1);
} else {
    if (quantity==1){
        message_text="Obtained a(n) [c_blue]"+item.name+"[]!";
    } else {
        message_text="Obtained "+string(quantity)+" [c_blue]"+item.plural+"[]!";
    }
    message_text_t=0;
    message_wait=0;
    ds_list_clear(message_options);
    ds_list_clear(message_option_ids);
    
    event_node_index=0;
    
    script_help_begin_text();
}
