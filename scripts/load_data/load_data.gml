/// @description  void load_data([file]);
/// @param [file]

if (argument_count==0){
    var datafile=PATH_DATA+"game.dddd";
} else {
    var datafile=argument[0];
}

if (!file_exists(datafile)){
    debug("data file not found: "+datafile+". using the dummy data file instead.");
    datafile=PATH_DUMMY_DATA+"game.dddd";
}

var original=buffer_load(datafile);
var erroneous=false;
var header=chr(buffer_read(original, buffer_u8))+chr(buffer_read(original, buffer_u8))+chr(buffer_read(original, buffer_u8));

if (header=="DDD"){
    // if it's uncompressed, don't decompress it
    var buffer=original;
} else {
    // if it's compressed, decompress it - if possible
    var buffer=buffer_inflate(original, 0, buffer_get_size(original));
    buffer_delete(original);
}

if (buffer==-1){
    erroneous=true;
} else {
    buffer_seek(buffer, buffer_seek_start, 0);
    
    /*
     * Header
     */
    
    var header=chr(buffer_read(buffer, buffer_u8))+chr(buffer_read(buffer, buffer_u8))+chr(buffer_read(buffer, buffer_u8));
    
    if (header=="DDD"){
        var version=buffer_read(buffer, buffer_u32);
        var what=buffer_read(buffer, buffer_u8);
        var things=buffer_read(buffer, buffer_u32);
        
        /*
         * data types
         */
        
        if (version>=DataVersions.NOT_STUPID_DATA_SIZE){
            // you will never have this many Things
            things=100000000;
        }
        
        var stop=false;
        repeat(things){
            var datatype=buffer_read(buffer, buffer_datatype);
            switch (datatype){
                // game stuff
                case SerializeThings.AUTOTILES_META:
                    load_autotiles_meta(buffer, version);
                    break;
                case SerializeThings.TILESET_META:
                    load_tilesets_meta(buffer, version);
                    break;
                case SerializeThings.EVENTS:
                    load_events(buffer, version);
                    break;
                case SerializeThings.MISC_MAP_META:
                    load_global_meta(buffer, version);
                    break;
                case SerializeThings.DATADATA:
                    load_datadata(buffer, version);
                    break;
                case SerializeThings.DATA_INSTANCES:
                    load_data_instances(buffer, version);
                    break;
                case SerializeThings.EVENT_CUSTOM:
                    load_event_custom(buffer, version);
                    break;
                // map stuff
                case SerializeThings.MAP_META:
                    load_map_contents_meta(buffer, version);
                    break;
                case SerializeThings.MAP_BATCH:
                    load_map_contents_batch(buffer, version);
                    break;
                case SerializeThings.MAP_DYNAMIC:
                    load_map_contents_dynamic(buffer, version);
                    break;
                // end of file
                case SerializeThings.END_OF_FILE:
                    stop=true;
                    break;
            }
            
            if (stop){
                break;
            }
        }
        
        if (what==SERIALIZE_MAP){
            map_batch_all();
            
            // hard-code this until a mechanism for starting the game is introduced
            if (player==noone){
                player=pawn_create("PLAYERPAWN", "Bilbo Baggins", 1, PawnPlayer);
                map_add_dynamic(get_active_map(), player, 5, 6, 0);
                Camera.following=player;
            }
        } else {
            // properties that refer to data can refer to the instance ID instead of
            // the GUID to make things easy later on, but you have to link them after
            // all of the data has been initialized
            
            load_data_link_items();
            load_data_link_attacks();
            
            // same for custom event nodes
            
            load_data_link_event_custom();
        }
        
        buffer_delete(buffer);
    } else {
        erroneous=true;
    }
}

if (erroneous){
    show_error("Bad game data file, can't load: "+datafile, true);
}

enum DataVersions {
    INITIAL                     =0,
    VRAX_REFERENCE              =1,
    STARTING_MAP                =2,
    MAP_VARS                    =3,
    MAP_3D                      =4,
    GAMEPLAY_GRID               =5,
    EVENT_GUID                  =6,
    MAP_ENTITY_EVENTS           =7,
    EVENT_NODE_GUID             =8,
    EVENT_NODE_FIXED_DATA_AGAIN =9,
    ENTITY_TRANSFORM            =10,
    DATADATA_DEFINITIONS        =11,
    NOT_STUPID_DATA_SIZE        =12,
    OPTIONS_ON_ENTITIES         =13,
    OPTIONS_ON_ENTITIES_WORKS   =14,
    MOVE_ROUTES                 =15,
    ENTITY_GUID                 =16,
    MOVE_ROUTE_MOVE_PARAMS      =17,
    _CURRENT                    /* = whatever the last one is + 1 */
}
