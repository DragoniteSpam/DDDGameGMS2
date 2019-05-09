/// @description  DataEventNode event_create_node(Event, name, EventNodeType, parent);
/// @param Event
/// @param  name
/// @param  EventNodeType
/// @param  parent

var node=instance_create(0, 0, DataEventNode);
node.event=argument[0];
node.name=argument[1];
node.type=argument[2];
node.parent=argument[3];

ds_list_add(argument[0].nodes, node);

return node;
