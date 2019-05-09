/// @description  void map_batch_all([DataMap]);
/// @param [DataMap]

if (argument_count>0){
    var map=argument[0];
} else {
    var map=get_active_map();
}

var n_static=ds_list_size(map.list_static);

vertex_begin(map.statics, World.vertex_format);

for (var i=0; i<n_static; i++){
    var thing=map.list_static[| i];
    // batch scripts should all take the parameters
    // (vertex buffer, Entity, x, y, z)
    script_execute(thing.batch, map.statics, thing, thing.xx, thing.yy, thing.zz);
}

vertex_end(map.statics);

// game maker will complain if you try to freeze an empty buffer
if (n_static>0){
    vertex_freeze(map.statics);
}
