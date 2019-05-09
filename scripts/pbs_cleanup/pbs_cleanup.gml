/*
 * Move PBS don't store animation data, and the Essentials animation data
 * wouldn't be of much use to 3D Game Maker anyhow, so we have to attach
 * everything on our own.
 */

var m, index;

index=get_move_from_name("METALCLAW", true);
if (index>-1){
    m=get_move(index);
    m.animation=ba_move_claw;
    m.animation_blending_color=c_silver;
}

/*
 * Update: I really don't enjoy animating moves. I'll do it later if anything
 * becomes of this project. For now everything besides Metal Claw will use
 * ba_move_basic.
 */

var a;

index=get_ability_from_name("STATIC", true);
if (index>-1){
    a=get_ability(index);
    a.on_contact=babl_contact_paralyze_user;
}

index=get_ability_from_name("INNERFOCUS", true);
if (index>-1){
    a=get_ability(index);
    a.can_flinch=false;
}

index=get_ability_from_name("SYNCHRONIZE", true);
if (index>-1){
    a=get_ability(index);
    array_clear(a.status_acceptance, StatusAcceptance.MIRROR);
    // syncronize doesn't affect minor status. you can make it do that if you
    // want, though.
}

index=get_ability_from_name("MAGNETPULL", true);
if (index>-1){
    a=get_ability(index);
    a.can_escape=babl_trap_steel;
}

index=get_ability_from_name("LEVITATE", true);
if (index>-1){
    a=get_ability(index);
    a.damage_from[Types.GROUND]=0;
}

index=get_ability_from_name("BLAZE", true);
if (index>-1){
    a=get_ability(index);
    a.low_health_factor[Types.FIRE]=World.settings.battle.ability_low_health_move_power;
}
index=get_ability_from_name("OVERGROW", true);
if (index>-1){
    a=get_ability(index);
    a.low_health_factor[Types.GRASS]=World.settings.battle.ability_low_health_move_power;
}

index=get_ability_from_name("INTIMIDATE", true);
if (index>-1){
    a=get_ability(index);
    a.on_entry=babl_enter_intimidate;
}

index=get_ability_from_name("SHEDSKIN", true);
if (index>-1){
    a=get_ability(index);
    a.on_round_end=babl_round_end_shed_skin;
}

var item;

index=get_item_from_name("MIRACLESEED", true);
if (index>-1){
    item=get_item(index);
    item.battle_hold_damage_mod=bi_damage_mod_grass;
}

index=get_item_from_name("CHARCOAL", true);
if (index>-1){
    item=get_item(index);
    item.battle_hold_damage_mod=bi_damage_mod_fire;
}

index=get_item_from_name("MAGNET", true);
if (index>-1){
    item=get_item(index);
    item.battle_hold_damage_mod=bi_damage_mod_electric;
}

index=get_item_from_name("MYSTICWATER", true);
if (index>-1){
    item=get_item(index);
    item.battle_hold_damage_mod=bi_damage_mod_water;
}

index=get_item_from_name("SILKSCARF", true);
if (index>-1){
    item=get_item(index);
    item.battle_hold_damage_mod=bi_damage_mod_normal;
}

index=get_item_from_name("LEFTOVERS", true);
if (index>-1){
    item=get_item(index);
    item.battle_hold_post_turn=bi_post_turn_leftovers;
}

index=get_item_from_name("FULLRESTORE", true);
if (index>-1){
    item=get_item(index);
    item.battle_use_from_bag=bi_use_full_restore;
    item.battle_use_action=bi_action_full_restore;
}
