if (!ds_queue_empty(actions)){
    script_execute(ds_queue_dequeue(actions));
}
