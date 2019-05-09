/// @description  ItemStack trainer_has_item(DataTrainer, item index);
/// @param DataTrainer
/// @param  item index

var list=argument0.items[get_item(argument1).pocket];

for (var i=0; i<ds_list_size(list); i++){
    if (list[| i].index==argument1){
        return list[| i];
    }
}

return noone;
