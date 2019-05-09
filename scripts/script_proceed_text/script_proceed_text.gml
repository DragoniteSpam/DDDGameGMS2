/// @description  void script_proceed_text(DataEventNode, Entity);
/// @param DataEventNode
/// @param  Entity

scribble_destroy(scribble_text);

if (++event_node_index==ds_list_size(argument0.data)){
    cutscene_begin(argument0.outbound[| 0], argument1);
} else {
    message_text=argument0.data[| event_node_index];
    message_text_t=0;
    
    script_help_begin_text();
}
