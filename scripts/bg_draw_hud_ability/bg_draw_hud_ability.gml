/// @description  void BattleHUDAbility.bg_draw_hud_ability();

if (user!=noone){
    var height=64;
    
    draw_set_font(FGameMedium);
    
    draw_set_valign(fa_middle);
    
    // text row
    draw_rectangle_9s(spr_window9s_hgss, x, y, UI_BATTLE_HUD_WIDTH, height);
    draw_text(x+32, y+32, string_hash_to_newline(L("%0's %1", user.name, user.ability.name)));
}
