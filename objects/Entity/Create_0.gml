name="Entity";

do {
    // range: [1, 2147483647] - 0 is "null"
    GUID=irandom((1<<31)-2)+1;
} until(!ds_map_exists(World.all_guids, GUID));

ds_map_add(World.all_guids, GUID, id);

load_script=load_entity;

// for fusing all static objects such as ground tiles and houses together,
// so the computer doesn't waste time drawing every single visible Entity
// individually
batch=null;

// for things that don't fit into the above category, including but not limited
// to NPCs, things that animate, things that move and things that need special
// shaders
render=null;

// for non mobile entities, effects and animations and stuff. for mobile enties,
// movement controls.
update=null;            // main controls
update_post=null;       // executes after everything else
update_new_cell=null;   // when Entity enters a new cell
update_still=null;      // executes when not moving

update_on_exit=null;    // when another entity ends contact with you
update_on_entry=null;   // when another entity begins contact with you

// what happens when two 

// for adding /removing the entity from the map's contents structure
// (different entities will need to do different things)
contents_adder=null;
contents_remover=null;

// you can have scripts that do both, if you want to have a static thing that
// sparkles or something

// this is basically the opposite of game maker's persistent flag, but doesn't
// use any built-in systems
deleteable=true;

xx=0;
yy=0;
zz=0;
off_xx=0;
off_yy=0;
off_zz=0;
rot_xx=0;
rot_yy=0;
rot_zz=0;
scale_xx=1;
scale_yy=1;
scale_zz=1;
target_xx=xx;
target_yy=yy;
target_zz=zz;
previous_xx=xx;
previous_yy=yy;
previous_zz=zz;

object_events=ds_list_create();

// options

animate_idle=false;
animate_movement=false;
direction_fix=true;

// autonomous movement - this only actually does anything in EntityDynamic,
// but later on i'll probably find a way to make it work anyway

autonomous_movement=AutonomousMovementTypes.FIXED;
autonomous_movement_speed=3;                            // 0: 0.125, 1: 0.25, 2: 0.5, 3: 1, 4: 2, 5: 4
autonomous_movement_frequency=2;                        // 0 through 4
autonomous_movement_route=0;                            // GUID

movement_routes=[];             // DataMovementRoutes
movement_route_mode=MoveRouteModes.AUTO;
movement_step=0;
movement_route_update=true;
movement_route_timer=0;

enum MoveRouteModes {
    OFF,
    AUTO,
    EVENT,
}

// don't want to use the built-in "solid" variable since that might cause
// things to break unexpectedly
am_solid=true;

var inventory_size=array_length_1d(Database.all_items);
inventory=array_create(inventory_size);

// list(s) of [guid, quantity]
for (var i=0; i<inventory_size; i++){
    inventory[i]=ds_list_create();
}

