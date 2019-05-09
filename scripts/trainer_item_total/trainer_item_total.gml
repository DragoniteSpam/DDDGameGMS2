/// @description  int trainer_item_total(DataTrainer, item index);
/// @param DataTrainer
/// @param  item index

var total=0;

for (var i=0; i<array_length_1d(argument0.items); i++){
    total=total+trainer_item_pocket_total(argument0, i);
}

return total;
