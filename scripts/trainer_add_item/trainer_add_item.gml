/// @description  void trainer_add_item(DataTrainer, item index, [count]);
/// @param DataTrainer
/// @param  item index
/// @param  [count]
// I really wish Game Maker was properly object oriented right now.

if (argument_count==3){
    var n=argument[2];
} else {
    var n=1;
}

var stack=trainer_has_item(argument[0], argument[1]);

if (stack==noone){
    var stack=instance_create(0, 0, ItemStack);
    stack.index=argument[1];
    stack.count=n;
    ds_list_add(argument[0].items[get_item(argument[1]).pocket], stack);
} else {
    stack.count=stack.count+n;
}
