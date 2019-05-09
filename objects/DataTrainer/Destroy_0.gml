for (var i=0; i<array_length_1d(items); i++){
    ds_list_destroy(items[i]);
}

for (var i=0; i<ds_list_size(party); i++){
    instance_activate_object(party[| i]);
    instance_destroy(party[| i]);
}

ds_list_destroy(party);

