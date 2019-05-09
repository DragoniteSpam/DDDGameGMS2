/// @description  map const_mesh_load_vrax(filename);
/// @param filename

var where=PATH_DATA+argument[0];
if (!file_exists(where)){
    debug("assets file not found: "+where+". using the dummy assets file instead.");
    where=PATH_DUMMY_DATA+"assets.vrax";
}

var map=ds_map_create();
var buffer=buffer_load(where);

var data=ds_map_create();
ds_map_read(data, buffer_read_string(buffer));

var version=data[? "version"];
if (ds_map_exists(data, "grid_size")){
    var grid_size=data[? "grid_size"];
} else {
    var grid_size=0;
}

ds_map_destroy(data);

var n=buffer_read(buffer, T);

repeat(n){
    var model_name=buffer_read_string(buffer);
    map[? model_name]=const_mesh_next(buffer, grid_size);
}

buffer_delete(buffer);

return map;
