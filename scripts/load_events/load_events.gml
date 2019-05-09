/// @description  void load_events(buffer, version);
/// @param buffer
/// @param  version

var version=argument1;
var n_events=buffer_read(argument0, buffer_u32);

var connections=ds_list_create();
var connection_map=ds_map_create();

World.all_events=array_create(n_events);

for (var n=0; n<n_events; n++){
    var event_name=buffer_read(argument0, buffer_string);
    var event=create_event(event_name);
    
    if (version>=DataVersions.EVENT_GUID){
        guid_set(event, buffer_read(argument0, buffer_u32));
    }
    
    var n_nodes=buffer_read(argument0, buffer_u32);
    
    ds_list_clear(connections);
    ds_list_clear(connection_map);
    
    repeat(n_nodes){
        var node_name=buffer_read(argument0, buffer_string);
        var node_type=buffer_read(argument0, buffer_u16);
        buffer_read(argument0, buffer_u32);         // position is ignored - that's only useful in
        buffer_read(argument0, buffer_u32);         // the editor
        
        var node=create_event_node(event, node_name, node_type, event.GUID);
        
        if (version>=DataVersions.EVENT_NODE_GUID){
            guid_set(node, buffer_read(argument0, buffer_u32));
        } // they're actually not useful to anyone if you don't do this but just check it
        // to keep it from crashing if you load a really old map
        
        var n_outbound=buffer_read(argument0, buffer_u8);

        ds_map_add(connection_map, node_name, node);
        var node_connections=ds_list_create();
        ds_list_add(connections, node_connections);
        
        repeat(n_outbound){
            if (version<DataVersions.EVENT_NODE_FIXED_DATA_AGAIN){
                var data=buffer_read(argument0, buffer_string);
                ds_list_add(node.data, data);
            }
            
            var connection_name=buffer_read(argument0, buffer_string);
            ds_list_add(node.outbound, noone);          // to be filled in later
            ds_list_add(node_connections, connection_name);
        }
        
        if (version>=DataVersions.EVENT_NODE_FIXED_DATA_AGAIN){
            var n_data=buffer_read(argument0, buffer_u8);
            repeat(n_data){
                ds_list_add(node.data, buffer_read(argument0, buffer_string));
            }
        }
        
        // special code
        switch (node_type){
            case EventNodeTypes.ENTRYPOINT:
            case EventNodeTypes.TEXT:
                break;
            case EventNodeTypes.CUSTOM:
                node.custom_guid=buffer_read(argument0, buffer_u32);
                var custom=guid_get(node.custom_guid);
                
                for (var i=0; i<array_length_1d(custom.types); i++){
                    var sub_list=ds_list_create();
                    var type=custom.types[i];
                    
                    switch (type[1]){
                        case DataTypes.INT:
                            var buffer_type=buffer_s32;
                            break;
                        case DataTypes.FLOAT:
                            var buffer_type=buffer_f32;
                            break;
                        case DataTypes.BOOL:
                            var buffer_type=buffer_u8;
                            break;
                        case DataTypes.STRING:
                            var buffer_type=buffer_string;
                            break;
                        case DataTypes.ENUM:
                        case DataTypes.DATA:
                            var buffer_type=buffer_u32;
                            break;
                    }
                    
                    var n_custom_data=buffer_read(argument0, buffer_u8);
                    
                    repeat(n_custom_data){
                        ds_list_add(sub_list, buffer_read(argument0, buffer_type));
                    }
                    ds_list_add(node.custom_data, sub_list);
                }
                break;
        }
    }
    
    for (var i=0; i<n_nodes; i++){
        var node=event.nodes[| i];
        var node_connection=connections[| i];
        
        for (var j=0; j<ds_list_size(node_connection); j++){
            if (string_length(node_connection[| j])>0){
                node.outbound[| j]=connection_map[? node_connection[| j]];
            }
        }
        
        ds_list_destroy(node_connection);
    }
    
    World.all_events[@ n]=event;
}

ds_list_destroy(connections);
ds_map_destroy(connection_map);
