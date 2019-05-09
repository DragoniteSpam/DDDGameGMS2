/// @description  ItemPocket pbs_read_item_ai_flags(internal name);
/// @param internal name

switch (argument0){
    case "POTION":
    case "SUPERPOTION":
    case "HYPERPOTION":
    case "MAXPOTION":
        return ItemAIFlags.HEAL_HP;
    case "FULLRESTORE":
        return ItemAIFlags.HEAL_HP|ItemAIFlags.HEAL_ALL_STATUS;
    case "FULLHEAL":
    // todo other full heal variations
        return ItemAIFlags.HEAL_ALL_STATUS;
    case "BURNHEAL":
    case "PARALYZEHEAL":
    case "ICEHEAL":
    case "ANTIDOTE":
    case "AWAKENING":
    // todo berries probably
        return ItemAIFlags.HEAL_SELECT_STATUS;
    case "XATTACK":
    case "XDEFENSE":
    case "XSPEED":
    case "XSPECIAL":
    case "XSPATK":
    case "XSPDEF":
    case "XACCURACY":
        return ItemAIFlags.BUFF;
    case "REVIVE":
    case "MAXREVIVE":
        return ItemAIFlags.REVIVE;
}

return ItemAIFlags.NONE;
