/// @description  int ds_priority_destroy_instances(queue);
/// @param queue

var n=ds_priority_size(argument0);

while (!ds_priority_empty(argument0)){
    instance_destroy(ds_priority_delete_max(argument0));
}

return n;
