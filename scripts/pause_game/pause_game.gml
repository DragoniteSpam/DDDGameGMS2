/// @description  void pause_game([stage = PauseStages.MAIN]);
/// @param [stage = PauseStages.MAIN]

var stage=PauseStages.MAIN;
if (argument_count==1){
    stage=argument[0];
}

Pause.stage=stage;

with (Pause){
    if (stage==PauseStages.MAIN){
        message_text="";
        message_text_t=0;
        
        if (scribble_text!=noone){
            scribble_destroy(scribble_text);
        }
        scribble_text=noone;
        
        cursor_main_index=0;
        cursor_inventory_index=0;
    }
}
