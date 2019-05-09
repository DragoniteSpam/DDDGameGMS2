stage=BattleStages.BEGIN;

for (var i=0; i<ds_list_size(teams); i++){
    for (var j=0; j<ds_list_size(teams[| i].owner.party); j++){
        var pkmn=teams[| i].owner.party[| j];
        pokemon_reset_battle_stat_mods(pkmn);
        pokemon_reset_volatile_stat_mods(pkmn);
        pkmn.owner=teams[| i].owner;
        
        var shf=get_pokemon_sprite_hash(pkmn, SpriteSides.FRONT);
        var shb=get_pokemon_sprite_hash(pkmn, SpriteSides.BACK);
        var shf_path=PATH_BATTLER+shf+".png";
        var shb_path=PATH_BATTLER+shb+".png";
        // If you can't find either of these files, the diagnostic error text thing is spat
        // out in the get_pokemon_sprite_hash script.
        if (!ds_map_exists(sprite_hash, shf)){
            if (file_exists(shf_path)){
                var sf=sprite_add(shf_path, 0, false, false, 0, 0);
                sprite_set_offset(sf, sprite_get_width(sf)/2, sprite_get_height(sf)/**5/6*/);
                sprite_hash[? shf]=sf;
            } else {
                var sf=spr_pokemon_unknown;
            }
            pkmn.spr_front=sf;
        } else {
            pkmn.spr_front=sprite_hash[? shf];
        }
        if (!ds_map_exists(sprite_hash, shb_path)){
            if (file_exists(shb_path)){
                var sb=sprite_add(shb_path, 0, false, false, 0, 0);
                sprite_set_offset(sb, sprite_get_width(sb)/2, sprite_get_height(sb));
                sprite_hash[? shb]=sb;
            } else {
                var sb=spr_pokemon_unknown;
            }
            pkmn.spr_back=sb;
        } else {
            pkmn.spr_back=sprite_hash[? shb];
        }
    }
}

ds_queue_enqueue(actions, battle_action_send_in_leads);
ds_queue_enqueue(actions, battle_action_lead_entry_abilities);

message(L("The battle has started!"));

// control returns to the ui prompt
