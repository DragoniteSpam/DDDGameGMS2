/// @description  void batch_mesh(vertex buffer, EntityMesh, xx, yy, zz);
/// @param vertex buffer
/// @param  EntityMesh
/// @param  xx
/// @param  yy
/// @param  zz

var buffer=argument0;
var mesh=argument1;

var xx=argument2*TILE_WIDTH;
var yy=argument3*TILE_HEIGHT;
var zz=argument4*TILE_DEPTH;

var data=mesh.mesh_data[MeshArrayData.DATA];
buffer_seek(data, buffer_seek_start, 0);

while (buffer_tell(data)<buffer_get_size(data)){
    // script arguments are parsed backwards and i don't think
    // there's a way to turn that off, and in any case it's a
    // better idea to just fetch the values first and *then*
    // pass them all to the script
    var npx=buffer_read(data, T);
    var npy=buffer_read(data, T);
    var npz=buffer_read(data, T);
    var transformed=transform_entity_point(mesh, npx, npy, npz);
    var px=transformed[vec3.xx];
    var py=transformed[vec3.yy];
    var pz=transformed[vec3.zz];
    var nx=buffer_read(data, T);
    var ny=buffer_read(data, T);
    var nz=buffer_read(data, T);
    var xtex=buffer_read(data, T);
    var ytex=buffer_read(data, T);
    var color=buffer_read(data, T);
    var alpha=buffer_read(data, T);
    
    vertex_point_complete(buffer, px, py, pz, nx, ny, nz, xtex, ytex, color, alpha);
}
