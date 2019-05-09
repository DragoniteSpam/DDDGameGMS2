/// @description  misc constants and enums - declare these first!

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
vertex_format_add_textcoord();
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

var t0=get_timer();

// pawn stuff

all_class_battle_bgm=const_class_battle_bgm();
all_class_victory_bgm=const_class_victory_bgm();
all_class_intro_me=const_class_intro_me();
all_class_battle_sprites=const_class_battle_sprites();
all_class_overworld_sprites=const_class_overworld_sprites();

// core stuff - game specific

all_evolution_methods=const_evolution_methods();            // dependencies: nothing
all_egg_groups=const_egg_groups();                          // dependencies: nothing
all_item_pockets=const_item_pockets();                      // dependencies: nothing
all_natures=const_natures();                                // dependencies: nothing

var path_types=PATH_PBS+"types.txt";
var path_abilities=PATH_PBS+"abilities.txt";
var path_moves=PATH_PBS+"moves.txt";
var path_items=PATH_PBS+"items.txt";
var path_pokemon=PATH_PBS+"monsters.txt";
var path_trainer_classes=PATH_PBS+"trainertypes.txt";
var path_trainers=PATH_PBS+"trainers.txt";

if (!file_exists(path_types)||USE_DUMMY_DATA){
    path_types=PATH_PBS_DUMMY+"types.txt";
}
if (!file_exists(path_abilities)||USE_DUMMY_DATA){
    path_abilities=PATH_PBS_DUMMY+"abilities.txt";
}
if (!file_exists(path_moves)||USE_DUMMY_DATA){
    path_moves=PATH_PBS_DUMMY+"moves.txt";
}
if (!file_exists(path_items)||USE_DUMMY_DATA){
    path_items=PATH_PBS_DUMMY+"items.txt";
}
if (!file_exists(path_pokemon)||USE_DUMMY_DATA){
    path_pokemon=PATH_PBS_DUMMY+"monsters.txt";
}
if (!file_exists(path_trainer_classes)||USE_DUMMY_DATA){
    path_trainer_classes=PATH_PBS_DUMMY+"trainertypes.txt";
}
if (!file_exists(path_trainers)||USE_DUMMY_DATA){
    path_trainers=PATH_PBS_DUMMY+"trainers.txt";
}

all_types=pbs_read_types(path_types);                       // dependencies: nothing
all_abilities=pbs_read_abilities(path_abilities);           // dependencies: nothing

all_moves=pbs_read_moves(path_moves);                       // dependencies: types
all_items=pbs_read_items(path_items);                       // dependencies: moves
all_pokemon=pbs_read_pokemon(path_pokemon);                 // dependencies: moves, types, evolutions, items, abilities

all_trainer_classes=pbs_read_trainer_classes(path_trainer_classes);// dependencies: pawn stuff
all_trainers=pbs_read_trainers(path_trainers);              // dependencies: natures, abilities, moves, items, pokémon, trainer classes

pbs_cleanup();

// core stuff - infrastructure

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

/*var test_map=add_map("Test", "TEST", "b_tileset_overworld.png");
map_construct_grids(test_map, 64, 64, 8);*/

debug("data init took "+string((get_timer()-t0)/MILLION)+" seconds");

/*
 * hard-coding for now; later they should be part of a data file
 */

move_confusion=array_add(all_moves, add_move("Self-Confusion", Types.QMARKS, MoveCategories.PHYSICAL, 0, 40, 0, 0, MoveTargets.USER, "when you hit yourself in confusion", ba_move_basic, array_compose(be_no_effect), array_compose(0), 0, ARRAY, "SELFCONFUSION"));
move_struggle=get_move_from_name("STRUGGLE", true);

if (array_length_1d(all_types)>1){
    // color values came from bulbapedia
    all_types[Types.NORMAL].color=$A8A878;
    all_types[Types.FIGHTING].color=$C03028;
    all_types[Types.FLYING].color=$A890F0;
    all_types[Types.POISON].color=$A040A0;
    all_types[Types.GROUND].color=$E0C068;
    all_types[Types.ROCK].color=$B8A038;
    all_types[Types.GHOST].color=$A8B820;
    all_types[Types.STEEL].color=$705898;
    all_types[Types.FIRE].color=$B8B8D0;
    all_types[Types.WATER].color=$F08030;
    all_types[Types.GRASS].color=$6890F0;
    all_types[Types.ELECTRIC].color=$78C850;
    all_types[Types.PSYCHIC].color=$F8D030;
    all_types[Types.ICE].color=$F85888;
    all_types[Types.DRAGON].color=$98D8D8;
    all_types[Types.DARK].color=$705848;
    //all_types[Types.FAIRY].color=$EE99AC; // fairy not implemented in the pbs but you can add it if you want
    all_types[Types.QMARKS].color=$68A090;
}

/*
 * finish up the init stuff
 */

// normally, the words that the game can use to reference an
// arbitrary status condition
major_status_names=array_compose(L("Sleep"), L("Poison"), L("Burn"), L("Paralyze"), L("Freeze"), L("Faint"), L("Pokerus"), L("Poison"), L("None"));
// i'm on the verge of just using a switch when these words need to be summoned but i'll give
// this one more shot
major_status_things=array_compose(L("Sleep"), L("Poison"), L("Burn"), L("Paralysis"), L("Freeze"), L("Faint"), L("Pokerus"), L("Poison"), L("None"));
// color tinting for rendering pokémon with the status
major_status_colors=array_compose(c_white, merge_color(c_purple, c_white, 0.65), merge_color(c_red, c_white, 0.65), merge_color(c_yellow, c_white, 0.65), merge_color(c_aqua, c_white, 0.65), c_white, c_white, merge_color(c_purple, c_white, 0.55), c_white);

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
// these may be generated on the fly as the player runs into random
// encounters so you'll have to deactivate them there also.
// it also means you can't ever say with (BattlePokemon).
// i'm guessing that's going to be a problem every once in a while.
instance_deactivate_object(BattlePokemon);
// these get processed as needed in World.Step or World.Draw or something,
// and only the ones that are visible on-screen or otherwise required by
// the game
instance_deactivate_object(Entity);

/* */
/*  */
