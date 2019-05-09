/// @description  void update_dynamic_new_cell(Entity);
/// @param Entity

var thing=argument0;
var map=get_active_map();

var cell_previous=map_get_at(map, thing.previous_xx, thing.previous_yy, thing.previous_zz);
if (cell_previous!=noone){
    for (var i=0; i<ds_list_size(cell_previous); i++){
        var previous=cell_previous[| i];
        script_execute(previous.update_on_exit, previous, thing);
    }
}

var cell_current=map_get_at(map, thing.xx, thing.yy, thing.zz);
if (cell_current!=noone){
    for (var i=0; i<ds_list_size(cell_current); i++){
        var current=cell_current[| i];
        script_execute(current.update_on_exit, current, thing);
    }
}
