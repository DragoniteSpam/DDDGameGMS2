/// @description  int trainer_item_pocket_total(DataTrainer, ItemPocket);
/// @param DataTrainer
/// @param  ItemPocket

var total=0;

var list=argument0.items[argument1];
for (var i=0; i<ds_list_size(list); i++){
    total=total+list[| i].count;
}

return total;
