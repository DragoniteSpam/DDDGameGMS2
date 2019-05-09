/// @description  void draw_moves_list(BattlePokemon, selected index);
/// @param BattlePokemon
/// @param  selected index
// this only draws the list, it does not control it. you most
// likely want to use menu_input in conjunction with this.

var text_list=ds_list_create();
var color_list=ds_list_create();
var aux_list=ds_list_create();
for (var i=0; i<array_length_1d(argument0.moves); i++){
    if (argument0.moves[i]==-1){
        ds_list_add(text_list, "---");
        ds_list_add(color_list, c_dkgray);
        ds_list_add(aux_list, -1, -1, -1, -1);
    } else {
        var base_move=get_move(argument0.moves[i]);
        ds_list_add(text_list, base_move.name);
        ds_list_add(aux_list, argument0.move_pp[i], total_move_pp(argument0, i), base_move.category, base_move.type);
        var f=argument0.move_pp[i]/total_move_pp(argument0, i);
        if (f>=0.5){
            ds_list_add(color_list, c_black);
        } else if (f>=0.25){
            ds_list_add(color_list, c_orange);
        } else if (f>0){
            ds_list_add(color_list, merge_color(c_red, c_orange, 0.5));
        } else {
            ds_list_add(color_list, c_red);
        }
    }
}
ds_list_add(text_list, L("(Back)"));
ds_list_add(color_list, c_black);
ds_list_add(aux_list, -1, -1, -1, -1);

var max_n=ds_list_size(text_list);

if (max_n==2){
    var text_font=FGameMediumLarge;
} else if (max_n==3){
    var text_font=FGameMedium;
} else {
    var text_font=FGameMedium;
}
draw_set_font(text_font);

var width_category=sprite_get_width(spr_move_category);
var width_type=sprite_get_width(spr_move_type);
var TEXT_BUFFER=8;
var EXTRA_WIDTH=64;
var max_width=ds_list_max_width(text_list)+EXTRA_WIDTH+width_category+width_type;

var text_spacing=font_get_size(text_font)*1.5;

var box_width=max_width+2*UI_TEXT_BOX_OFFSET_W+text_spacing*2;  // the bigger the font, the more horizontal buffer the text box will have, as well
var box_height=text_spacing*(max_n+2);
var box_x=W-box_width;
var box_y=H-box_height;

draw_rectangle_9s(spr_window9s_hgss, box_x, box_y, box_width, box_height);

draw_set_valign(fa_middle);

// use two form loops so you can only draw_set_halign twice instead of up to nine times
for (var i=0; i<max_n; i++){
    draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+text_spacing*(i+1.5), string_hash_to_newline(text_list[| i]));
}

draw_set_halign(fa_right);

for (var i=0; i<max_n; i++){
    if (aux_list[| 4*i]>-1){
        var yy=box_y+text_spacing*(i+1.5);
        draw_text(box_x+box_width-UI_TEXT_BOX_OFFSET_W-width_type-width_category-TEXT_BUFFER, yy, string_hash_to_newline(string(aux_list[| 4*i])+"/"+string(aux_list[| 4*i+1])));
        draw_move_category(aux_list[| 4*i+2], box_x+box_width-UI_TEXT_BOX_OFFSET_W-width_type-width_category, yy);
        draw_type(aux_list[| 4*i+3], box_x+box_width-UI_TEXT_BOX_OFFSET_W-width_type, yy);
    }
}

draw_set_halign(fa_left);

if (argument1>=0){
    draw_selection_arrow(box_x+UI_TEXT_BOX_OFFSET_W+text_spacing/3, box_y+text_spacing*(argument1+1.5));
}

ds_list_destroy(text_list);
ds_list_destroy(color_list);
ds_list_destroy(aux_list);
