/// @description  void script_help_text();
// all of the variables in here belong to World, see scribble_begin_text if you want to see how they're set

scribble_text=scribble_create(message_text, undefined, UI_TEXT_BOX_WIDTH-2*UI_TEXT_BOX_OFFSET_W, c_black);
scribble_typewriter_in(scribble_text, SCRIBBLE_TYPEWRITER_PER_CHARACTER, World.settings.gameplay.text_speed, World.settings.gameplay.text_smoothness);
scribble_set_box_alignment(scribble_text, fa_left, fa_top);
