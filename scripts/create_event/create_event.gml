/// @description  DataEvent event_create(name);
/// @param name

var event=instance_create(0, 0, DataEvent);
event.name=argument0;

// unlike in the editor, these may not be created at runtime and
// all_events is an array, not a list
//ds_list_add(World.all_events, event);

return event;
