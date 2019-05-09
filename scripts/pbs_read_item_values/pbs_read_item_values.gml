/// @description  ItemPocket pbs_read_item_values(internal name, default value);
/// @param internal name
/// @param  default value

switch (argument0){
    case "POTION":
        return 20;
    case "SUPERPOTION":
        return 50;
    case "HYPERPOTION":
        // 120 in gens 7+
        return 200;
    case "MAXPOTION":
    case "FULLRESTORE":
        return -1;
    case "BURNHEAL":
        return MajorStatus.BURN;
    case "PARALYZEHEAL":
        return MajorStatus.PARALYZE;
    case "ICEHEAL":
        return MajorStatus.FREEZE;
    case "ANTIDOTE":
        return MajorStatus.POISON;
    case "AWAKENING":
        return MajorStatus.SLEEP;
    // todo berries probably
    case "XATTACK":
        return Stats.ATTACK;
    case "XDEFENSE":
        return Stats.DEFENSE;
    case "XSPEED":
        return Stats.SPEED;
    case "XSPECIAL":
    case "XSPATK":
        return Stats.SPATTACK;
    case "XSPDEF":
        return Stats.SPDEFENSE;
    case "XACCURACY":
        return Stats.ACCURACY;
    case "REVIVE":
        return 0.5;
    case "MAXREVIVE":
        return 1;
}

return argument1;
