/// @description  void load_entity_event_page(buffer, Entity, version);
/// @param buffer
/// @param  Entity
/// @param  version

var page=create_instantiated_event("");
load_generic(argument0, page, argument2);

var bools=buffer_read(argument0, buffer_u16);
page.enabled=unpack(bools, 0);
page.condition_switch_global_enabled=unpack(bools, 1);
page.condition_variable_global_enabled=unpack(bools, 2);
page.condition_switch_self_enabled=unpack(bools, 3);
page.condition_variable_self_enabled=unpack(bools, 4);
page.condition_item_enabled=unpack(bools, 5);
page.condition_code_enabled=unpack(bools, 6);

page.condition_switch_global=buffer_read(argument0, buffer_u16);
page.condition_variable_global=buffer_read(argument0, buffer_u16);
page.condition_switch_self=buffer_read(argument0, buffer_u16);
page.condition_variable_self=buffer_read(argument0, buffer_u16);
page.condition_item=buffer_read(argument0, buffer_u16);

// later: condition_code

page.condition_variable_global_comparison=buffer_read(argument0, buffer_u8);
page.condition_variable_global_value=buffer_read(argument0, buffer_f32);
page.condition_variable_self_comparison=buffer_read(argument0, buffer_u8);
page.condition_variable_self_value=buffer_read(argument0, buffer_f32);

if (argument2<DataVersions.OPTIONS_ON_ENTITIES){
    buffer_read(argument0, buffer_u8);
    buffer_read(argument0, buffer_u8);
    buffer_read(argument0, buffer_u8);
}

/*page.autonomous_movement=buffer_read(argument0, buffer_u8);
page.autonomous_movement_speed=buffer_read(argument0, buffer_u8);
page.autonomous_movement_frequency=buffer_read(argument0, buffer_u8);*/

var bools=buffer_read(argument0, buffer_u16);
/*page.option_animate_movement=unpack(bools, 0);
page.option_animate_idle=unpack(bools, 1);
page.option_direction_fix=unpack(bools, 2);*/

page.trigger=buffer_read(argument0, buffer_u8);

page.event_guid=buffer_read(argument0, buffer_u32);
page.event_entrypoint=buffer_read(argument0, buffer_u32);

ds_list_add(argument1.object_events, page);

// it would probably be a good idea to throw a warning if the events/entrypoints
// are not found, but since that's under the user's control i may not actually
// spend the processing time doing that.
// if (guid_get(page.event_guid)==noone)
// if (guid_get(page.event_entrypoint)==noone)
