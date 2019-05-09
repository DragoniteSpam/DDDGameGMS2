/// @description  void cutscene_begin(DataEventNode, Entity);
/// @param DataEventNode
/// @param  Entity

if (argument0==noone){
    World.event_node_current=noone;
    World.event_node_object=noone;
    World.event_current=noone;
} else {
    World.event_node_current=argument0;
    World.event_node_object=argument1;
    World.event_current=guid_get(argument0.parent);
    // it's theoretically possible to launch an event from somewhere other
    // than an entrypoint, but the editor doesn't let you do that for the
    // sake of simplicity
    script_execute(event_node_begin[argument0.type], argument0, argument1);
}
