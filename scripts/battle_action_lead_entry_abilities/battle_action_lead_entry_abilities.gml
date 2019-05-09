for (var i=0; i<ds_list_size(contestants); i++){
    script_execute(contestants[| i].ability.on_entry, round_actions, contestants[| i]);
}
