/// @description  ItemOverworldUsability pbs_read_item_overworld_code(number);
/// @param number

switch (argument0){
    case 0:
        return ItemOverworldUsability.NOPE;
    case 1:
    case 3:
    case 4:
    case 5:
        return ItemOverworldUsability.POKEMON;
    case 2:
        return ItemOverworldUsability.TRAINER;
}
