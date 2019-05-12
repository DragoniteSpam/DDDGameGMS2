// These work pretty much the same as move flags, but they're
// used by the AI to assist in determining whether you need to
// use an item or not.
enum ItemAIFlags {
    NONE = 1 << 0,
    HEAL_HP = 1 << 1,
    HEAL_SELECT_STATUS = 1 << 2,
    HEAL_ALL_STATUS = 1 << 3,
    REVIVE = 1 << 4,
    BUFF = 1 << 5
}

event_inherited();

name = "Base Item";
internal_name = "BASEITEM";
summary = "it doesnt do anything";
plural = "Base Items";

pocket = 0;
price = 500;

overworld = null;
battle = null;
// this may not be necessary at all but i'm not going to delete it
// quite yet
special = null;

// the id of the move that the tm/hm attaches to this item, or the
// amount of health restored...
value = 0;
ai_flags = ItemAIFlags.NONE;

// ujrpg

equip_slot = 0;
mod_atk = 0;
mod_def = 0;
mod_agl = 0;
mod_hp = 0;
mod_mp = 0;

