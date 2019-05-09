/// @description  array const_item_pockets();

enum ItemPockets {
    ITEMS,
    MEDICINE,
    BALLS,
    TMS,
    BERRIES,
    MAIL,
    BATTLE,
    KEY
}

var array;
array=array_create(ItemPockets.KEY);

// todo change the colors to something more appropriate later, maybe
array[ItemPockets.ITEMS]=add_item_pocket(L("Items"), c_pink, -1, -1);
array[ItemPockets.MEDICINE]=add_item_pocket(L("Medicine"), c_pink, -1, -1);
array[ItemPockets.BALLS]=add_item_pocket(L("Balls"), c_pink, -1, -1);
array[ItemPockets.TMS]=add_item_pocket(L("TMs/HMs"), c_pink, -1, -1);
array[ItemPockets.BERRIES]=add_item_pocket(L("Berries"), c_pink, -1, -1);
array[ItemPockets.MAIL]=add_item_pocket(L("Mail"), c_pink, -1, -1);
array[ItemPockets.BATTLE]=add_item_pocket(L("Battle Items"), c_pink, -1, -1);
array[ItemPockets.KEY]=add_item_pocket(L("Key Items"), c_pink, -1, -1);

return array;
