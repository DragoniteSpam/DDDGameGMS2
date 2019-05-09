if (!ds_queue_empty(round_actions)){
    var action=ds_queue_dequeue(round_actions);
    script_execute(action.script, action.params);
    instance_destroy(action);
}
