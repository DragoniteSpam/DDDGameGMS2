/// @description  void script_help_draw_text();

var text_box_start_x=0;
var text_box_start_y=H-UI_TEXT_BOX_HEIGHT;

draw_rectangle_9s(spr_window9s_hgss, text_box_start_x, text_box_start_y, UI_TEXT_BOX_WIDTH, UI_TEXT_BOX_HEIGHT);
scribble_draw(scribble_text, text_box_start_x+UI_TEXT_BOX_OFFSET_W, text_box_start_y+UI_TEXT_BOX_OFFSET_H);

scribble_step(scribble_text);

if (get_release_a()){
    var state=scribble_typewriter_get_state(scribble_text);
    if (state==1){
        cutscene_proceed();
    } else if (state>0.25){
        scribble_typewriter_in(scribble_text, SCRIBBLE_TYPEWRITER_WHOLE);
    }
}
