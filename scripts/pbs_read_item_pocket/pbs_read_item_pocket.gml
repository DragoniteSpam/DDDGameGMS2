/// @description  ItemPocket pbs_read_item_pocket(number);
/// @param number

// in theory this is just (number-1). in practice i like to be safe.
switch (argument0){
    case 1:
        return ItemPockets.ITEMS;
    case 2:
        return ItemPockets.MEDICINE;
    case 3:
        return ItemPockets.BALLS;
    case 4:
        return ItemPockets.TMS;
    case 5:
        return ItemPockets.BERRIES;
    case 6:
        return ItemPockets.MAIL;
    case 7:
        return ItemPockets.BATTLE;
    case 8:
        return ItemPockets.KEY;
}

return ItemPockets.ITEMS;
