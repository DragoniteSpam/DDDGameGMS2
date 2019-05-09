if (hud!=noone){
    instance_destroy(hud);
}

if (surface_exists(surface)){
    surface_free(surface);
}

ds_map_destroy(misc_data);

