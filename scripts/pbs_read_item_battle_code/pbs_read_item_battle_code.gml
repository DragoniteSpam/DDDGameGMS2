/// @description  ItemOverworldUsability pbs_read_item_battle_code(number);
/// @param number

switch (argument0){
    case 0:
        return ItemBattleUsability.NOPE;
    case 1:
    case 3:
        return ItemBattleUsability.POKEMON;
    case 2:
        return ItemBattleUsability.BALL;
    case 4:
        // i'm pretty sure there are no items in vanilla essentials
        // that use this code ('can be used directly, but does not
        // disappear after use') but ehh
        return ItemBattleUsability.UNKNOWN;
}
