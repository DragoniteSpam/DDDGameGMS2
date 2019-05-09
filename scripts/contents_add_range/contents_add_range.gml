/// @description  void contents_add_range(DataMap, Entity, xx, yy, zz);
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
        var slice=argument0.contents[# argument2+i, argument3+j];
        
        for (var k=data[MeshArrayData.ZMIN]; k<data[MeshArrayData.ZMAX]; k++){
            var cell=slice[@ argument4+k];
            
            if (cell==noone){
                cell=ds_list_create();
                slice[@ argument4+k]=cell;
            }
            
            ds_list_add(cell, argument1);
        }
    }
}
