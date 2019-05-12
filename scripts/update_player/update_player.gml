/// @description  void update_player(entity);
/// @param entity
// this script is called by World because argument0 is asleep. make
// sure to prefix all of argument0's instance variables with argument0.

if (get_press_start()){
    World.pause_queued = PauseStages.MAIN;
}

if (Pause.stage == PauseStages.HIDDEN && argument0.movement_free && World.event_node_current == noone){
    argument0.previous_xx = argument0.xx;
    argument0.previous_yy = argument0.yy;
    argument0.previous_zz = argument0.zz;
    
    if (get_press_a()){
        // getting the argument0 that you're facing would be that much
        // easier if these could map to 
        var dir = World.direction_map[? argument0.map_direction];
        var what_is_here = map_get_at(get_active_map(), round(argument0.xx + dcos(dir)), round(argument0.yy - dsin(dir)), round(argument0.zz));
        for (var i = 0; i < ds_list_size(what_is_here); i++){
            var thing_here = what_is_here[| i];
            var broken = false;
            for (var j = 0; j < ds_list_size(thing_here.object_events); j++){
                var node = guid_get(thing_here.object_events[| j].event_entrypoint);
                if (event_valid(thing_here, node)){
                    cutscene_begin(node, thing_here);
                    broken = true;
                    break;
                }
            }
            // i don't think you can break out of a loop twice in one statement so
            if (broken){
                break;
            }
        }
        // don't delete this list, since it still belongs to the map
    } else {
        // may collapse these into a smaller block of code later, but not now
        if (World.game_player_grid){
            if (Controller.left){
                argument0.target_xx--;
            }
            if (Controller.right){
                argument0.target_xx++;
            }
            if (Controller.up){
                argument0.target_yy--;
            }
            if (Controller.down){
                argument0.target_yy++;
            }
        } else {
            var fstep = argument0.mspd * dt;
            if (Controller.ls_magnitude > Controller.gamepad_dead_zone){
                argument0.target_xx = argument0.xx + fstep * dcos(Controller.ls_angle);
                argument0.target_yy = argument0.yy - fstep * dsin(Controller.ls_angle);
            }
        }
    }
}
