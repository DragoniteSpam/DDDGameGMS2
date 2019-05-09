/// @description  This is analagous to an "event page" in RPG Maker
event_inherited();

name="instantiated event";

// conditions - these just mirror RPG Maker currently. I'm not sure if all, if any, will
// be used and will probably try to figure out how to implement Lua or something instead

enabled=true;

// the variable comparison values need to be numbers (floats),
// by the way.

condition_switch_global_enabled=false;
condition_switch_global=0;
condition_variable_global_enabled=false;
condition_variable_global=0;
condition_variable_global_comparison=Comparisons.EQUAL;
condition_variable_global_value=0;
condition_switch_self_enabled=false;
condition_switch_self=0;
condition_variable_self_enabled=false;
condition_variable_self=0;
condition_variable_self_comparison=Comparisons.EQUAL;
condition_variable_self_value=0;
condition_item_enabled=false;
condition_item=0;
// no actor condition because I don't foresee those being used
condition_code_enabled=false;
condition_code=0;

enum Comparisons {
    LESS,
    LESS_OR_EQUAL,
    EQUAL,
    GREATER_OR_EQUAL,
    GREATER,
    NOT_EQUAL
}

// autonomous movement - only useful for things not marked as "static"

autonomous_movement=AutonomousMovementTypes.FIXED;
autonomous_movement_speed=3;                            // 0: 0.125, 1: 0.25, 2: 0.5, 3: 1, 4: 2, 5: 4
autonomous_movement_frequency=2;                        // 0 through 4
autonomous_movement_route=ds_list_create();
autonomous_movement_route_repeat=true;
autonomous_movement_route_skip=false;

enum AutonomousMovementTypes {
    FIXED,
    RANDOM,
    APPROACH,
    CUSTOM
}

// options

option_animate_movement=true;
option_animate_idle=false;
option_direction_fix=false;

// trigger

trigger=EventTriggers.ActionButton;

enum EventTriggers {
    ActionButton,
    PlayerTouch,
    EventTouch,
    Autorun,
    Parallel,
}

// the important bit

event_guid=0;
event_entrypoint="";

