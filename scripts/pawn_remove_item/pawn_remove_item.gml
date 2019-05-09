/// @description  void pawn_remove_item(Pawn, item index, [count]);
/// @param Pawn
/// @param  item index
/// @param  [count]

if (argument_count==3){
    var n=argument[2];
} else {
    var n=1;
}

trainer_remove_item(get_trainer(argument[0].trainer_index), argument[1], n);
