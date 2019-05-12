/// @description  void draw_pause_inventory();

draw_set_font(FGameMedium);
draw_set_colour(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var text = ds_list_create();
var visible_pockets = ds_list_create();
var text_count = ds_list_create();

var show_totals = false;

if (Pause.inventory_pocket == -1){
    var header = L("Inventory");
    for (var i = 0; i < array_length_1d(Database.all_item_pockets); i++){
        if (!ds_list_empty(World.player.inventory[i])){
            ds_list_add(text, Database.all_item_pockets[i].name);
            ds_list_add(visible_pockets, i);
        }
    }
} else {
    var base_pocket = Database.all_item_pockets[Pause.inventory_pocket];
    var header = base_pocket.name;
    var pocket = World.player.inventory[Pause.inventory_pocket];
    
    if (base_pocket.stackable){
        show_totals = true;
    }
    
    for (var i = 0; i < ds_list_size(pocket); i++){
        var stack = pocket[| i];
        ds_list_add(text, guid_get(stack[0]).name);
        ds_list_add(text_count, stack[1]);
    }
}

var n = ds_list_size(text);

var index = Pause.cursor_inventory_index;

// todo play sound?
if (Controller.press_up){
    index = (--index + (n + 1)) % (n + 1);
} else if (Controller.press_down){
    index = ++index % (n + 1);
} else if (Controller.press_left){
    index = 0;
} else if (Controller.press_right){
    index = n;
}

draw_rectangle_9s(spr_window9s_hgss, UI_MENU_START_X, UI_MENU_START_Y, UI_MENU_WIDTH, (n + 4) * UI_MENU_SLOT_HEIGHT);
draw_text(UI_MENU_START_X + 48, UI_MENU_START_Y + 1.5 * UI_MENU_SLOT_HEIGHT, string_hash_to_newline(header));

for (var i = 0; i < n; i++){
    var xx = UI_MENU_START_X + 48;
    var yy = UI_MENU_START_Y + (i + 2.5) * UI_MENU_SLOT_HEIGHT;
    // todo icons?
    draw_text(xx, yy, string_hash_to_newline(text[| i]));
    if (show_totals){
        var count_string = "x " + string(text_count[| i]);
        draw_text(UI_MENU_START_X + UI_MENU_WIDTH - 48 - string_width(string_hash_to_newline(count_string)), yy, string_hash_to_newline(count_string));
    }
}

draw_text(UI_MENU_START_X + 48, UI_MENU_START_Y + (n + 2.5) * UI_MENU_SLOT_HEIGHT, string_hash_to_newline("Back"));

draw_cursor(UI_MENU_START_X + 32, UI_MENU_START_Y + (index + 2.5) * UI_MENU_SLOT_HEIGHT);

if (get_release_a()){
    if (index == n){
        if (Pause.inventory_pocket == -1){
            pause_game(PauseStages.MAIN);
        } else {
            Pause.inventory_pocket = -1;
            // setting index now will reset the actual cursor index later
            index = 0;
        }
    } else {
        Pause.inventory_pocket = visible_pockets[| index];
    }
} else if (get_press_start()){
    pause_game(PauseStages.HIDDEN);
} else if (get_press_select()){
    pause_game(PauseStages.MAIN);
}

Pause.cursor_inventory_index = index;

ds_list_destroy(text);
ds_list_destroy(text_count);
