/// @description  void cutscene_proceed();

// the proceed script for each event node may issue the command to
// cutscene_begin() the next step . . . or not
script_execute(World.event_node_proceed[World.event_node_current.type],
    World.event_node_current, World.event_node_object);
