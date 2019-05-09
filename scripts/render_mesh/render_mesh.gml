/// @description  void render_mesh(EntityMesh, xx, yy, zz);
/// @param EntityMesh
/// @param  xx
/// @param  yy
/// @param  zz

var mesh=argument0;

transform_set(0, 0, 0, mesh.rot_xx, mesh.rot_yy, mesh.rot_zz, 1, 1, 1);
transform_add(0, 0, 0, 0, 0, 0, mesh.scale_xx, mesh.scale_yy, mesh.scale_zz);
transform_add((mesh.xx+mesh.off_xx)*TILE_WIDTH, (mesh.yy+mesh.off_yy)*TILE_HEIGHT, (mesh.zz+mesh.off_zz)*TILE_DEPTH, 0, 0, 0, 1, 1, 1);

vertex_submit(mesh.mesh_data[MeshArrayData.VBUFF], pr_trianglelist, get_active_texture());

transform_reset();
