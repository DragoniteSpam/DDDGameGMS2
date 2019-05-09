/// @description  void draw_pause_main();

draw_set_font(FGameMedium);
draw_set_colour(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var text=array_compose(L("Party"), L("Items"), L("Encyclopedia"), L("Save"), L("Settings"), L("Back to Game"), L("Quit"));
var n=array_length_1d(text);

var index=Pause.cursor_main_index;

// todo play sound?
if (Controller.press_up){
    index=(--index+n)%n;
} else if (Controller.press_down){
    index=++index%n;
} else if (Controller.press_left){
    index=0;
} else if (Controller.press_right){
    index=n-1;
}

draw_rectangle_9s(spr_window9s_hgss, UI_MENU_START_X, UI_MENU_START_Y, UI_MENU_WIDTH, (n+2)*UI_MENU_SLOT_HEIGHT);

for (var i=0; i<n; i++){
    draw_text(UI_MENU_START_X+48, UI_MENU_START_Y+(i+1.5)*UI_MENU_SLOT_HEIGHT, string_hash_to_newline(text[i]));
}

draw_cursor(UI_MENU_START_X+32, UI_MENU_START_Y+(index+1.5)*UI_MENU_SLOT_HEIGHT);

if (get_release_a()){
    switch (index){
        case 0:
            //pause_game(PauseStages.PARTY);
            break;
        case 1:
            Pause.inventory_pocket=-1;
            pause_game(PauseStages.INVENTORY);
            break;
        case 2:
            //pause_game(PauseStages.ENCYCLOPEDIA);
            break;
        case 3:
            //pause_game(PauseStages.SAVE);
            break;
        case 4:
            //pause_game(PauseStages.SETTINGS);
            break;
        case 5:
            pause_game(PauseStages.HIDDEN);
            break;
        case 6:
            //pause_game(PauseStages.QUIT);
            break;
    }
} else if (get_press_start()){
    pause_game(PauseStages.HIDDEN);
} else if (get_press_select()){
    pause_game(PauseStages.HIDDEN);
}

Pause.cursor_main_index=index;
