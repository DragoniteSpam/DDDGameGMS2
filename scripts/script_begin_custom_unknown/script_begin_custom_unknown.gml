/// @description  void script_begin_custom_unknown(DataEventNode, Entity);
/// @param DataEventNode
/// @param  Entity

var entity=argument1;

var base=guid_get(argument0.custom_guid);

message_text="[c_red]Unimplemented node type: "+base.name+" (size: "+string(ds_list_size(argument0.custom_data))+")[]";
message_text_t=0;
message_wait=0;
ds_list_clear(message_options);
ds_list_clear(message_option_ids);

event_node_index=0;

script_help_begin_text();
