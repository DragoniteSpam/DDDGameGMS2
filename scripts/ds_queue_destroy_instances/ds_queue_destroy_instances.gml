/// @description  int ds_queue_destroy_instances(queue);
/// @param queue

var n=ds_queue_size(argument0);

while (!ds_queue_empty(argument0)){
    instance_destroy(ds_queue_dequeue(argument0));
}

return n;
