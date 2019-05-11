/// @description  game setup

var t0=get_timer();

enum vec2 {
    xx, yy
}

enum vec3 {
    xx, yy, zz
}

enum vec4 {
    r, g, b, a
}

enum Languages {
    ENGLISH,
}

enum SerializeThings {
    ERROR                   =$00000000,
    // basic stuff
    MESHES_META             =$00000001,
    MESHES_REF              =$00000002,
    MESHES                  =$00000003,
    TILESET_META            =$00000004,
    TILESET_BASE            =$00000005,
    TILESET_AUTO            =$00000006,
    TILESET_ALL             =$00000007,
    PARTICLES               =$00000008,
    NPCS                    =$00000009,
    NPCS_FULL               =$0000000A,
    FOLLOWERS               =$0000000B,
    FOLLOWERS_FULL          =$0000000C,
    MISC_GRAPHICS           =$0000000D,
    MISC_GRAPHICS_FULL      =$0000000E,
    UI_GRAPHICS             =$0000000F,
    UI_GRAPHICS_FULL        =$00000010,
    GLOBAL_GRAPHICS         =$00000011,
    AUDIO_SE                =$00000012,
    AUDIO_SE_FULL           =$00000013,
    AUDIO_BGM               =$00000014,
    MAP_BATCH               =$00000015,
    MAP_DYNAMIC             =$00000016,
    EVENTS                  =$00000017,
    AUTOTILES_META          =$00000018,
    AUTOTILES               =$00000019,
    MAP_META                =$0000001A,
    DATADATA                =$0000001B,
    EVENT_CUSTOM            =$0000001C,
    EVENT_TEMPLATE          =$0000001D,
    // game data
    DATA_ERROR              =$00000100,
    DATA_INSTANCES          =$00000101,
    // misc
    MISC_ERROR              =$00001000,
    MISC_MAP_META           =$00001001,
    MISC_GLOBAL             =$00001002,
    MISC_UI                 =$00001003,
    // the last one i think
    END_OF_FILE             =$00002000,
}

enum ETypes {
    ENTITY,
    ENTITY_TILE,
    ENTITY_TILE_AUTO,
    ENTITY_MESH,
    ENTITY_PAWN,
    ENTITY_EFFECT,
    ENTITY_EVENT
}

etype_objects=array_compose(Entity,
    EntityTile,
    EntityAutoTile,
    EntityMesh,
    /*Entity*/Pawn,
    EntityEffect,
    EntityEvent);

enum AvailableAutotileProperties {
    PICTURE, FRAMES, WIDTH
    // sprite index, animation frames, horizontal segments
}

/* */
singleton();

debug_last_write=0;
debug_log=buffer_create(1<<16, buffer_grow, 1);
debug_modified=false;

instance_create(0, 0, Camera);
instance_create(0, 0, Controller);
instance_create(0, 0, Database);
instance_create(0, 0, Pause);

/*
 * This will fork off a couple different settings objects (input,
 * battle, graphics, audio, maybe a few other things)
 */

settings=instance_create(0, 0, Settings);

/*
 * Vertex format(s)
 */

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_colour();
// extra vertex data isn't stored here, at least for now
vertex_format=vertex_format_end();

/*
 * Default battlefield ground
 */

var s=32;

model_floor=vertex_create_buffer();
vertex_begin(model_floor, vertex_format);

for (var i=0; i<=BATTLEFIELD_SIZE; i=i+s){
    for (var j=0; j<=BATTLEFIELD_SIZE; j=j+s){
        vertex_point_complete(model_floor, i, j, 0, 0, 0, 1, 0, 0, c_white, 1);
        vertex_point_complete(model_floor, i+s, j, 0, 0, 0, 1, 1, 0, c_white, 1);
        vertex_point_complete(model_floor, i+s, j+s, 0, 0, 0, 1, 1, 1, c_white, 1);
        
        vertex_point_complete(model_floor, i+s, j+s, 0, 0, 0, 1, 1, 1, c_white, 1);
        vertex_point_complete(model_floor, i, j+s, 0, 0, 0, 1, 0, 1, c_white, 1);
        vertex_point_complete(model_floor, i, j, 0, 0, 0, 1, 0, 0, c_white, 1);
    }
}

vertex_end(model_floor);
vertex_freeze(model_floor);

/*
 * Stuff related to showing messages on the screen
 */

message_text="";
message_text_t=0;
message_wait=0;
message_continue_after_wait=false;
message_options=ds_list_create();
message_option_ids=ds_list_create();

event_current=noone;            // DataEvent (rarely used, but may be useful for reporting errors)
event_node_current=noone;       // DataEventNode
event_node_object=noone;        // Entity who called the event
event_node_index=0;             // some event nodes have multiple steps to save space

event_node_begin=array_compose(script_begin_entry, script_begin_text, script_begin_custom);
event_node_draw=array_compose(null, script_draw_text, script_draw_custom);
event_node_proceed=array_compose(null, script_proceed_text,script_proceed_custom);

scribble_text=noone;

pause_queued=PauseStages.HIDDEN;// this can be any pause stage - in case you want to open up a page directly, for example

enum EventNodeTypes {
    ENTRYPOINT,
    TEXT,
    CUSTOM,
}

// It makes all the sense in the world for this to be a
// property of Battle, since (at least for now) these
// variables are used in relation to that, but later on
// we're going to need them for dialogue cutscenes and
// stuff, probably, and I don't want to have two systems
// that do the exact same thing.
message_option_index=0;
// This is supposed to be the 'id' stored in message_option_ids
// but you're allowed to hijack it for other purposes.
message_option_result=-1;

/*
 * language
 * do this before you initialize anything involving text
 */

language_codes=array_compose("default");    // it, ja, pt, etc.
language_names=array_compose("English");

language=Languages.ENGLISH;

language_text=array_compose(ds_map_create());
read_language();

language_text_not_found=ds_map_create();

/*
 * pbs, data
 */

all_guids=ds_map_create();

// arrays get resized to (n) when the data is loaded just once
available_autotiles=array_compose(0);
all_tilesets=array_compose(0);
all_maps=ARRAY;
all_event_custom=ARRAY;
all_events=ARRAY;

game_map_starting="";
game_player_grid=true;

// all_maps is a string of names, that's all - it's how you look up the map files when asked to
// by events, etc

//active_map=noone;                           // this used to be an index; now it's just a value because only one map can be loaded at once
all_mesh_map=noone;                         // defined in load_data()

/*
 * finish up the init stuff
 */

tf=array_compose(L("false"), L("true"));
dt=0;

direction_map=ds_map_create();
direction_map[? Directions.DOWN]=270;
direction_map[? Directions.LEFT]=180;
direction_map[? Directions.RIGHT]=0;
direction_map[? Directions.UP]=90;

//instance_create(0, 0, DebugMapSpawner);
//instance_create(0, 0, DebugBattleSpawner);

player=noone;
load_data();

var starting_map=PATH_MAP+World.game_map_starting+IMPORT_EXTENSION_MAP;
if (file_exists(starting_map)){
    load_data(starting_map);
} else {
    debug("map file not found: "+starting_map+". using the dummy map file instead.");
    load_data(PATH_DUMMY_DATA+"MAP.dddm");
}

// scribble

scribble_init_start(PATH_FONT, 4096);
scribble_init_add_font("FGameMedium");              // the first font added is the default one
scribble_init_add_font("FGameHuge");
scribble_init_add_font("FGameLarge");
scribble_init_add_font("FGameMediumLarge");
scribble_init_add_font("FGameSmall");
scribble_init_end();

// turn a bunch of things off

instance_deactivate_object(Struct);
instance_deactivate_object(Settings);
instance_deactivate_object(Entity);

debug("setup took "+string((get_timer()-t0)/MILLION)+" seconds");