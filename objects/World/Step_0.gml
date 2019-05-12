dt = delta_time / MILLION;

var map = get_active_map();

for (var i = 0; i < ds_list_size(map.list_dynamic); i++){
    var thing = map.list_dynamic[| i];
    script_execute(thing.update, thing);
}

// as always don't like running two for loops that do the same
// thing but the update_post script may depend on all of the
// other entities completing their regular update

for (var i = 0; i < ds_list_size(map.list_dynamic); i++){
    var thing = map.list_dynamic[| i];
    script_execute(thing.update_post, thing);
}

with (Camera){
    script_execute(camera_behavior);
}

if (player.movement_free){
    if (pause_queued != PauseStages.HIDDEN){
        pause_game(pause_queued);
        pause_queued = PauseStages.HIDDEN;
    }
}

if (get_timer() - debug_last_write > MILLION * 60 && debug_modified){
    debug_write();
}

