// UI stuff

gpu_set_cullmode(cull_noculling);

if (Pause.stage!=PauseStages.HIDDEN){
    shader_set(shSepia);
    // hard-coded, do not touch
    shader_set_uniform_f(shader_get_uniform(shSepia, "strength"), 0.5);
}

draw_surface(application_surface, 0, 0);

shader_reset();

if (event_node_current!=noone){
    script_execute(event_node_draw[event_node_current.type], event_node_current, event_node_object);
}

draw_pause();

with (Effect){
    script_execute(render);
}

// todo something with different UI based on the game mode, but I'm in a hurry