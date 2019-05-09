ds_list_destroy(types);
ds_list_destroy(abilities);
ds_list_destroy(hidden_abilities);
ds_list_destroy(moves);
ds_list_destroy(move_levels);
ds_list_destroy(egg_moves);
ds_list_destroy(egg_groups);

ds_list_destroy(indices);

for (var i=0; i<ds_list_size(evolutions); i++){
    instance_destroy(evolutions[| i]);
}
ds_list_destroy(evolutions);

ds_map_destroy(forms);

