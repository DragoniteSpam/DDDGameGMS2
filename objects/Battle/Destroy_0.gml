ds_list_destroy_instances(teams);
ds_list_destroy(contestants);
ds_list_destroy_instances(drawables);
ds_list_destroy(replacements);

ds_queue_destroy_instances(actions);
ds_queue_destroy_instances(round_actions);
ds_queue_destroy_instances(individual_actions);
ds_priority_destroy_instances(priority);

// the more responsible way to do this would be to remember what
// sprites were created in the first place, and destroy those.
// maybe i'll do that later.
var sph=ds_map_find_first(sprite_hash);
sprite_delete(sph);
do {
    sph=ds_map_find_next(sprite_hash, sph);
    sprite_delete(sph);
} until(sph==ds_map_find_last(sprite_hash));
ds_map_destroy(sprite_hash);

ds_map_destroy(misc_data);

draw_texture_flush();

