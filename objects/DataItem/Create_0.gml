/// @description  constants and stuff

enum ItemOverworldUsability {
    NOPE,
    POKEMON,
    TRAINER,
}

enum ItemBattleUsability {
    NOPE,
    POKEMON,
    BALL,
    TRAINER,
    UNKNOWN,
}

// These work pretty much the same as move flags, but they're
// used by the AI to assist in determining whether you need to
// use an item or not.
enum ItemAIFlags {
    NONE=1<<0,
    HEAL_HP=1<<1,
    HEAL_SELECT_STATUS=1<<2,
    HEAL_ALL_STATUS=1<<3,
    REVIVE=1<<4,
    BUFF=1<<5
}

event_inherited();

name="Base Item";
internal_name="BASEITEM";
summary="it doesnt do anything";
plural="Base Items";

pocket=ItemPockets.ITEMS;
price=500;

overworld=null;
battle=bi_no_use;
// this may not be necessary at all but i'm not going to delete it
// quite yet
special=null;

// the id of the move that the tm/hm attaches to this item, or the
// amount of health restored...
value=0;
ai_flags=ItemAIFlags.NONE;

battle_use_from_bag=bi_no_use;
battle_use_action=bi_action_no_use;

battle_hold_post_turn=bi_post_turn_nothing;
battle_hold_damage_mod=bi_damage_mod_default;

// ujrpg

equip_slot=0;
mod_atk=0;
mod_def=0;
mod_agl=0;
mod_hp=0;
mod_mp=0;

