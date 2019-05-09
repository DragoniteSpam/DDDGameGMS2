/// @description  void draw_moves_details(move index);
/// @param move index
// this only draws the list, it does not control it. you most
// likely want to use menu_input in conjunction with this.

if (argument0==-1){
    return false;
}

var base_move=get_move(argument0);

var half_width=240;
var half_height=176;
var start_x=W/2-half_width;
var start_y=H/2-half_height;

var third=start_x+(half_width*2)/3;
var third2=start_x+(half_width*2)*2/3;

draw_rectangle_9s(spr_window9s_hgss, start_x, start_y, half_width*2, half_height*2);

draw_set_font(FGameMediumLarge);
draw_set_halign(fa_center);

draw_text(W/2, start_y+48, string_hash_to_newline(base_move.name));

draw_set_font(FGameMedium);

var  text=L("Type:");
draw_text(W/2, start_y+96, string_hash_to_newline(text));
draw_type(base_move.type, W/2+string_width(string_hash_to_newline(text+"  "))/2, start_y+96);

var text=L("Category:");
draw_text(W/2, start_y+128, string_hash_to_newline(text));
draw_move_category(base_move.category, W/2+string_width(string_hash_to_newline(text+"  "))/2, start_y+128);

if (base_move.accuracy==0){
    var text=L("N/A");
} else {
    var text=string(base_move.accuracy)+"%";
}
draw_text(third, start_y+160, string_hash_to_newline(L("Accuracy: %0", text)));
if (base_move.accuracy==0){
    var text=L("N/A")
} else {
    var text=string(base_move.value);
}
draw_text(third2, start_y+160, string_hash_to_newline(L("Power: %0", text)));

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_ext(start_x+32, start_y+192-16, string_hash_to_newline(base_move.summary), -1, half_width*2-64);
