if (contents!=noone){
    // if the collision grid exists the lists have to also
    // since they're created in the same place
    for (var i=0; i<ds_list_size(list_static); i++){
        instance_activate_object(list_static[| i]);
        instance_destroy(list_static[| i]);
    }
    
    for (var i=0; i<ds_list_size(list_dynamic); i++){
        instance_activate_object(list_dynamic[| i]);
        instance_destroy(list_dynamic[| i]);
    }
    
    for (var i=0; i<xx; i++){
        for (var j=0; j<yy; j++){
            if (contents[# i, j]!=noone){
                ds_list_destroy(contents[# i, j]);
            }
        }
    }
    
    ds_grid_destroy(contents);
    ds_list_destroy(list_static);
    ds_list_destroy(list_dynamic);
}

vertex_delete_buffer(statics);

ds_list_destroy(audio_ambient);
ds_list_destroy(audio_ambient_frequencies);

