singleton();

stage=PauseStages.HIDDEN;

message_text="";
message_text_t=0;
scribble_text=noone;

cursor_main_index=0;
cursor_inventory_index=0;

inventory_pocket=-1;

enum PauseStages {
    HIDDEN,
    MAIN,
    PARTY,
    INVENTORY,
    ENCYCLOPEDIA,
    SAVE,
    SETTINGS,
    QUIT,
}

