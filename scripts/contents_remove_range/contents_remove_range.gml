/// @description  void contents_remove_range(DataMap, Entity, xx, yy, zz);
/// @param DataMap
/// @param  Entity
/// @param  xx
/// @param  yy
/// @param  zz
// Does not check to see if the specified coordinates are in bounds.
// You are responsible for that.

var data=argument1.mesh_data;

for (var i=data[MeshArrayData.XMIN]; i<data[MeshArrayData.XMAX]; i++){
    for (var j=data[MeshArrayData.YMIN]; j<data[MeshArrayData.YMAX]; j++){
        for (var k=data[MeshArrayData.ZMIN]; k<data[MeshArrayData.ZMAX]; k++){
            var slice=argument0.contents[# argument2+i, argument3+j]
            var cell=slice[argument4+k];
            
            // if the specified object cannot be found at (x, y, z) the game
            // will crash. you should ONLY remove entities from locations
            // where you know they can be found.
            
            ds_list_delete(cell, ds_list_find_index(cell, argument1));
            if (ds_list_size(cell)==0){
                ds_list_destroy(cell);
                slice[@ argument4+k]=noone;
            }
        }
    }
}
