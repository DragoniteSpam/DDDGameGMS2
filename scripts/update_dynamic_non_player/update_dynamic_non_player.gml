/// @description  void update_dynamic_non_player(Entity);
/// @param Entity

var thing=argument0;
var autonomous=guid_get(thing.autonomous_movement_route);
var n=array_length_1d(autonomous.steps);

if (thing.movement_route_mode!=MoveRouteModes.OFF&&autonomous!=noone){
    if (thing.movement_route_update){
        var data=autonomous.steps[thing.movement_step];
        switch (data[@ 0]){
            case MoveRouteActions.MOVE_DOWN:
                var howfar=data[@ 1];
                thing.target_yy=thing.yy+howfar;
                thing.movement_route_update=false;
                break;
            case MoveRouteActions.MOVE_UP:
                var howfar=data[@ 1];
                thing.target_yy=thing.yy-howfar;
                thing.movement_route_update=false;
                break;
            case MoveRouteActions.MOVE_LEFT:
                var howfar=data[@ 1];
                thing.target_xx=thing.xx-howfar;
                thing.movement_route_update=false;
                break;
            case MoveRouteActions.MOVE_RIGHT:
                var howfar=data[@ 1];
                thing.target_xx=thing.xx+howfar;
                thing.movement_route_update=false;
                break;
            case MoveRouteActions.MOVE_LOWER_LEFT:
                var howfar=data[@ 1];
                thing.target_xx=thing.xx-howfar;
                thing.target_yy=thing.yy+howfar;
                thing.movement_route_update=false;
                break;
            case MoveRouteActions.MOVE_LOWER_RIGHT:
                var howfar=data[@ 1];
                thing.target_xx=thing.xx+howfar;
                thing.target_yy=thing.yy+howfar;
                thing.movement_route_update=false;
                break;
            case MoveRouteActions.MOVE_UPPER_LEFT:
                var howfar=data[@ 1];
                thing.target_xx=thing.xx-howfar;
                thing.target_yy=thing.yy-howfar;
                thing.movement_route_update=false;
                break;
            case MoveRouteActions.MOVE_UPPER_RIGHT:
                var howfar=data[@ 1];
                thing.target_xx=thing.xx+howfar;
                thing.target_yy=thing.yy+howfar;
                thing.movement_route_update=false;
                break;
            case MoveRouteActions.MOVE_RANDOM:
                if (choose(true, false)){
                    thing.target_xx=thing.xx+choose(-1, 1);
                } else {
                    thing.target_yy=thing.yy+choose(-1, 1);
                }
                thing.movement_route_update=false;
                break;
            case MoveRouteActions.MOVE_TOWARDS_PLAYER:
                thing.movement_route_update=false;
                // hey
                break;
            case MoveRouteActions.MOVE_AWAY_PLAYER:
                thing.movement_route_update=false;
                // hey
                break;
            case MoveRouteActions.MOVE_FORWARD:
                switch (thing.map_direction){
                    case Directions.RIGHT:
                        thing.target_xx=thing.xx+1;
                        break;
                    case Directions.LEFT:
                        thing.target_xx=thing.xx-1;
                        break;
                    case Directions.DOWN:
                        thing.target_yy=thing.yy+1;
                        break;
                    case Directions.UP:
                        thing.target_yy=thing.yy-1;
                        break;
                }
                thing.movement_route_update=false;
                break;
            case MoveRouteActions.MOVE_BACKWARD:
                switch (thing.map_direction){
                    case Directions.RIGHT:
                        thing.target_xx=thing.xx-1;
                        break;
                    case Directions.LEFT:
                        thing.target_xx=thing.xx+1;
                        break;
                    case Directions.DOWN:
                        thing.target_yy=thing.yy-1;
                        break;
                    case Directions.UP:
                        thing.target_yy=thing.yy+1;
                        break;
                }
                thing.movement_route_update=false;
                break;
            case MoveRouteActions.MOVE_JUMP:
                // data[@ 1] was originally map name until i realized that doesnt make sense in a move route
                var newx=data[@ 2];
                var newy=data[@ 3];
                var newz=data[@ 4];
                thing.movement_route_update=false;
                break;
            case MoveRouteActions.MOVE_ACTUALLY_JUMP:
                var cells=data[@ 1];
                break;
            case MoveRouteActions.MOVE_TO:
                var newx=data[@ 1];
                var newy=data[@ 2];
                thing.movement_route_update=false;
                break;
            case MoveRouteActions.WAIT:
                var seconds=data[@ 1];
                thing.movement_route_timer=seconds;
                thing.movement_route_update=false;
                break;
            // column 2
            case MoveRouteActions.TURN_DOWN:
                thing.map_direction=Directions.DOWN;
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.TURN_LEFT:
                thing.map_direction=Directions.LEFT;
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.TURN_RIGHT:
                thing.map_direction=Directions.RIGHT;
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.TURN_UP:
                thing.map_direction=Directions.UP;
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.TURN_90_RIGHT:
                thing.map_direction=(thing.map_direction+90)%360;
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.TURN_90_LEFT:
                thing.map_direction=(thing.map_direction+270)%360;
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.TURN_180:
                thing.map_direction=(thing.map_direction+180)%360;
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.TURN_90_RANDOM:
                if (thing.map_direction==Directions.RIGHT||thing.map_direction==Directions.LEFT){
                    thing.map_direction=choose(Directions.UP, Directions.DOWN);
                } else {
                    thing.map_direction=choose(Directions.RIGHT, Directions.LEFT);
                }
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.TURN_RANDOM:
                thing.map_direction=choose(Directions.RIGHT, Directions.LEFT, Directions.UP, Directions.DOWN);
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.TURN_TOWARD_PLAYER:
                thing.movement_step=(++thing.movement_step)%n;
                // hey
                break;
            case MoveRouteActions.TURN_AWAY_PLAYER:
                thing.movement_step=(++thing.movement_step)%n;
                // hey
                break;
            // column 3
            case MoveRouteActions.SWITCH_ON:
                var index=data[@ 1];
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.SWITCH_OFF:
                var index=data[@ 1];
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.CHANGE_SPEED:
                var value=data[@ 1];
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.CHANGE_FREQUENCY:
                var value=data[@ 1];
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.WALKING_ANIM_ON:
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.WALKING_ANIM_OFF:
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.STEPPING_ANIM_ON:
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.STEPPING_ANIM_OFF:
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.DIRECTION_FIX_ON:
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.DIRECTION_FIX_OFF:
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.SOLID_ON:
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.SOLID_OFF:
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.TRANSPARENT_ON:
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.TRANSPARENT_OFF:
                thing.movement_step=(++thing.movement_step)%n;
                break;
            case MoveRouteActions.CHANGE_GRAPHIC:
                thing.movement_step=(++thing.movement_step)%n;
                // not implemented
                break;
            case MoveRouteActions.CHANGE_OPACITY:
                thing.movement_step=(++thing.movement_step)%n;
                var opacity=data[@ 1];
                break;
            case MoveRouteActions.CHANGE_TINT:
                thing.movement_step=(++thing.movement_step)%n;
                // not implemented
                break;
            case MoveRouteActions.PLAY_SE:
                thing.movement_step=(++thing.movement_step)%n;
                // not implemented
                break;
            case MoveRouteActions.EVENT:
                var event=guid_get(data[@ 1]);
                var entrypoint=guid_get(data[@ 2]);
                break;
        }
    }
}
