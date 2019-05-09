var pkmn=Battle.misc_data[? "who"];

var max_n=7;

var text_spacing=font_get_size(FGameMedium)*1.5;

var box_width=UI_BATTLE_HUD_WIDTH;
var box_height=text_spacing*(max_n+2);
var box_x=W-box_width;
var box_y=H-box_height;

draw_rectangle_9s(spr_window9s_hgss, box_x, box_y, box_width, box_height);

draw_set_valign(fa_middle);

var delta_hp=Battle.misc_data[? "new hp"]-Battle.misc_data[? "old hp"];
var delta_atk=Battle.misc_data[? "new atk"]-Battle.misc_data[? "old atk"];
var delta_def=Battle.misc_data[? "new def"]-Battle.misc_data[? "old def"];
var delta_spa=Battle.misc_data[? "new spa"]-Battle.misc_data[? "old spa"];
var delta_spd=Battle.misc_data[? "new spd"]-Battle.misc_data[? "old spd"];
var delta_spe=Battle.misc_data[? "new spe"]-Battle.misc_data[? "old spe"];

draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing, string_hash_to_newline(L("%0: +%1", pkmn.name, Battle.misc_data[? "new level"]-Battle.misc_data[? "old level"])));
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing, string_hash_to_newline(L("+%0 HP", delta_hp)));
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing*2, string_hash_to_newline(L("+%0 Attack", delta_atk)));
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing*3, string_hash_to_newline(L("+%0 Defense", delta_def)));
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing*4, string_hash_to_newline(L("+%0 Sp. Attack", delta_spa)));
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing*5, string_hash_to_newline(L("+%0 Sp. Defense", delta_spd)));
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing*6, string_hash_to_newline(L("+%0 Speed", delta_spe)));

if (Controller.release_a||Controller.release_b){
    battle_input_processing_reset(false, BattleInputStages.LEVEL_STAT_TOTAL);
}
