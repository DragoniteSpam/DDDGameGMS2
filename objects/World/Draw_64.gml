// UI stuff

d3d_set_culling(false);

if (Pause.stage!=PauseStages.HIDDEN){
    shader_set(shSepia);
    // hard-coded, do not touch
    shader_set_uniform_f(shader_get_uniform(shSepia, "strength"), 0.5);
}

draw_surface(application_surface, 0, 0);

shader_reset();

if (event_node_current!=noone){
    script_execute(event_node_draw[event_node_current.type], event_node_current, event_node_object);
}

draw_pause();

// todo something with different UI based on the game mode, but I'm in a hurry
exit;

with (Effect){
    script_execute(render);
}

var text_box_start_x=0;
var text_box_start_y=H-UI_TEXT_BOX_HEIGHT;

draw_rectangle_9s(spr_window9s_hgss, text_box_start_x, text_box_start_y, UI_TEXT_BOX_WIDTH, UI_TEXT_BOX_HEIGHT);

draw_set_font(FGameMedium);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

var message_length=string_length(message_text);
var option_max_n=ds_list_size(message_options);

draw_text_ext(text_box_start_x+UI_TEXT_BOX_OFFSET_W, text_box_start_y+UI_TEXT_BOX_OFFSET_H, string_hash_to_newline(string_copy(message_text, 1, message_text_t)), -1, UI_TEXT_WIDTH);

for (var i=0; i<ds_list_size(Battle.drawables); i++){
    with (Battle.drawables[| i].hud){
        bg_draw_hud();
    }
    with (Battle.drawables[| i].hud_ability){
        bg_draw_hud_ability();
    }
}

message_text_t=min(message_length, ++message_text_t);

/*
 * ALL INPUT GOES BELOW THIS LINE
 */

if (message_wait==0){
    var input_has_been_processed=false;
    if (message_text_t==message_length){
        /*
         * multiple choice things
         */
        
        if (option_max_n>0){
            draw_menu_from_list(message_options, message_option_index);
        }
        
        // among other things, this probably needs to have a period of one second instead of two,
        // and probably should be placed underneath the final line of text (or at the end of it)
        /*if (current_second%2==0){
            draw_sprite_ext(spr_select, 0, W-2*UI_TEXT_BOX_OFFSET_W, H-2*UI_TEXT_BOX_OFFSET_H, 2, 2, 270, c_white, 1);
        }*/
        // in some circumstances input_processing can be reset in the battle input processing
        // script, which will cause both input processing parts of this code to execute, which
        // isn't supposed to happen. to solve that we save the state of that variable before
        // we do anything to it.
        input_has_been_processed=Battle.input_processing!=noone;
        if (input_has_been_processed){
            battle_input_processing();
        }
    }
    
    /*
     * Game Maker gurus do not like game logic in the Draw event.
     * I do not like Game Maker gurus. Actually, yes I do. But I don't
     * like their stance on game logic in the Draw event, at least,
     * not when there's only one active view. In libgdx and probably
     * some other frameworks/engines they're basically the same thing.
     *
     * By the way, don't use more than one view in this game unless
     * you have a really good idea about what you're doing, you'll 
     * most probably break things.
     */
    
    if (Battle.input_ready){
        // if input processing is going on, the action button is handled in the script that draws the options on the screen, 'cause i'm a good engineer
        if (!input_has_been_processed){
            if (Controller.release_a){
                if (message_text_t<message_length){
                    message_text_t=message_length;
                } else {
                    if (ds_list_size(message_options)>0){
                        message_option_result=message_option_ids[| message_option_index];
                    } else {
                        message_option_result=-1;
                    }
                    clear();
                    battle_advance();
                }
            } else {
                message_option_index=menu_input(message_option_index, option_max_n);
            }
        }
    } else {
        // I'm PRETTY sure this is going to end up being like animation
        // effects and stuff. If it does, it should be removed from the
        // root if/else entirely becuase you'll want it to be executing
        // continuously.
        battle_process();
    }
} else {
    message_wait=max(message_wait-dt, 0);
    if (message_wait==0&&message_continue_after_wait){
        message_continue_after_wait=false;
        battle_advance();
    }
}

/* */
/*  */
