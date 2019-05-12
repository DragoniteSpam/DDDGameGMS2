/// @description  void draw_menu_from_list(list, selected index, [color list]);
/// @param list
/// @param  selected index
/// @param  [color list]
// this only draws the list, it does not control it. you most
// likely want to use menu_input in conjunction with this.

var text_list=argument[0];
var selected_index=argument[1];
var color_list=noone;

switch (argument_count){
    case 3:
        color_list=argument[2];
}

var max_n=ds_list_size(text_list);
var default_color=draw_get_colour();

if (max_n==2){
//    var text_font=FGameLarge;
    var text_font=FGameMediumLarge;
} else if (max_n==3){
//    var text_font=FGameMediumLarge;
    var text_font=FGameMedium;
} else {
    var text_font=FGameMedium;
}
draw_set_font(text_font);

var max_width=ds_list_max_width(text_list);

var text_spacing=font_get_size(text_font)*1.5;

var box_width=max_width+2*UI_TEXT_BOX_OFFSET_W+text_spacing*2;  // the bigger the font, the more horizontal buffer the text box will have, as well
var box_height=text_spacing*(max_n+2);
var box_x=W-box_width;
var box_y=H-box_height;

draw_rectangle_9s(spr_window9s_hgss, box_x, box_y, box_width, box_height);

draw_set_valign(fa_middle);

for (var i=0; i<max_n; i++){
    if (color_list==noone){
        var c=default_color;
    } else {
        var c=color_list[| i];
    }
    draw_text_colour(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+text_spacing*(i+1.5), string(text_list[| i]), c, c, c, c, 1);
}

if (selected_index>=0){
    draw_selection_arrow(box_x+UI_TEXT_BOX_OFFSET_W+text_spacing/3, box_y+text_spacing*(selected_index+1.5));
}
