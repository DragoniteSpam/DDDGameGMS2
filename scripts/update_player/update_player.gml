/// @description  void update_player(entity);
/// @param entity
// this script is called by World because thing is asleep. make
// sure to prefix all of thing's instance variables with thing.

var thing=argument0;

if (get_press_start()){
    World.pause_queued=PauseStages.MAIN;
}

if (Pause.stage==PauseStages.HIDDEN&&thing.movement_free&&World.event_node_current==noone){
    thing.previous_xx=thing.xx;
    thing.previous_yy=thing.yy;
    thing.previous_zz=thing.zz;
    
    if (get_press_a()){
        // getting the thing that you're facing would be that much
        // easier if these could map to 
        var dir=World.direction_map[? thing.map_direction];
        var what_is_here=map_get_at(get_active_map(), round(thing.xx+dcos(dir)), round(thing.yy-dsin(dir)), round(thing.zz));
        for (var i=0; i<ds_list_size(what_is_here); i++){
            var thing=what_is_here[| i];
            var broken=false;
            for (var j=0; j<ds_list_size(thing.object_events); j++){
                var node=guid_get(thing.object_events[| j].event_entrypoint);
                if (event_valid(thing, node)){
                    cutscene_begin(node, thing);
                    broken=true;
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
                thing.target_xx--;
            }
            if (Controller.right){
                thing.target_xx++;
            }
            if (Controller.up){
                thing.target_yy--;
            }
            if (Controller.down){
                thing.target_yy++;
            }
        } else {
            var fstep=thing.mspd*dt;
            if (Controller.ls_magnitude>Controller.gamepad_dead_zone){
                thing.target_xx=thing.xx+fstep*dcos(Controller.ls_angle);
                thing.target_yy=thing.yy-fstep*dsin(Controller.ls_angle);
            }
        }
    }
}
