/// @description  void attach_pokemon_to_trainer(DataTrainer, BattlePokemon, [position]);
/// @param DataTrainer
/// @param  BattlePokemon
/// @param  [position]

var position=ds_list_size(argument[0].party);

switch (argument_count){
    case 3:
        position=argument[2];
}

argument[1].trainer=argument[0];
if (position<ds_list_size(argument[0].party)){
    ds_list_insert(argument[0].party, position, argument[1]);
} else {
    ds_list_add(argument[0].party, argument[1]);
}
