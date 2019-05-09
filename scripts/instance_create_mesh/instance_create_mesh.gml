/// @description  EntityMesh instance_create_mesh(MeshName);
/// @param MeshName

with (instance_create(0, 0, EntityMesh)){
    switch (argument_count){
        case 1:
            mesh_name=argument[0];
            if (ds_map_exists(World.all_mesh_map, mesh_name)){
                mesh_data=World.all_mesh_map[? mesh_name];
            } else {
                show_message("did not find mesh: "+mesh_name);
            }
            break;
    }
    return id;
}
