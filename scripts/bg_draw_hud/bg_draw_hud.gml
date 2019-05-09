/// @description  void BattleHUD.bg_draw_hud();

if (user!=noone){
    var base=get_pokemon(user.species);
    var level=get_pokemon_level(user);
    var bar_height=16;
    var exp_bar_height=12;
    var text_y=y+32;
    var hp_bar_y=text_y+24;
    var hp_text_y=hp_bar_y+24;
    var exp_bar_y=hp_text_y+28;
    
    draw_set_font(FGameMedium);
    
    // foes/not player pawns have slightly smaller status boxes
    if (user.owner==Camera.following){
        var offset=0;
    } else {
        var offset=40;
    }
    
    draw_set_valign(fa_middle);
    
    // text row
    draw_rectangle_9s(spr_window9s_hgss, x, y, UI_BATTLE_HUD_WIDTH, UI_BATTLE_HUD_HEIGHT-offset);
    draw_text(x+32, text_y, string_hash_to_newline(user.name));
    
    var level_string=L("Lv. %0", string(level));
    
    draw_sprite(spr_gender, user.gender, x+UI_BATTLE_HUD_WIDTH-16-32-string_width(string_hash_to_newline(level_string)), text_y);
    if (user.status!=MajorStatus.NONE){
        draw_major_status(user.status, x+UI_BATTLE_HUD_WIDTH-16-32-string_width(string_hash_to_newline(level_string))-sprite_get_width(spr_gender)-sprite_get_width(spr_major_status), text_y);
    }
    
    draw_set_halign(fa_right);
    draw_text(x+UI_BATTLE_HUD_WIDTH-32, text_y, string_hash_to_newline(level_string));
    
    // hp bar row
    draw_health_bar(x+UI_BATTLE_HUD_WIDTH/2, hp_bar_y-bar_height/2, x+UI_BATTLE_HUD_WIDTH-UI_BATTLE_HUD_BUFFER_X, hp_bar_y+bar_height/2, pokemon_hp_f(user));
    /*
     * if user.owner.battle_show_details:
     *   - show exp bar (can be placeholder for now)
     *   - show hp text
     */
    if (user.owner==Camera.following){
        // hp text row
        draw_set_halign(fa_center);
        draw_text(x+(UI_BATTLE_HUD_WIDTH-32)*3/4, hp_text_y, string_hash_to_newline(string(floor(user.act_hp))+"/"+string(user.act[Stats.HP])));
        
        // exp bar row
        var exp_base=get_experience(level, base.growth_rate);
        var exp_next=get_experience(level+1, base.growth_rate);
        var f=(user.experience-exp_base)/(exp_next-get_experience(level, base.growth_rate));
        draw_exp_bar(x+64, exp_bar_y-exp_bar_height/2, x+UI_BATTLE_HUD_WIDTH-32, exp_bar_y+exp_bar_height/2, f);
    }
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
