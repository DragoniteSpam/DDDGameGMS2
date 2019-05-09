/// @description  void map_construct_grids(DataMap, x, y, z);
/// @param DataMap
/// @param  x
/// @param  y
/// @param  z
// There are no 3D data structures in Game Maker so we have to chain some
// lower-order ones together. If a grid already exists for the map it will be
// deleted - but the contents will not be

if (ds_exists(argument0.contents, ds_type_grid)){
    ds_grid_destroy(argument0.contents);
    debug("a grid already exists for "+argument0.internal_name+" and will be deleted");
}

var grid=ds_grid_create(argument1, argument2);

for (var i=0; i<argument1; i++){
    for (var j=0; j<argument2; j++){
        grid[# i, j]=array_create(argument3);
        array_clear(grid[# i, j], noone);
    }
}

argument0.xx=argument1;
argument0.yy=argument2;
argument0.zz=argument3;

argument0.contents=grid;
argument0.list_static=ds_list_create();
argument0.list_dynamic=ds_list_create();
