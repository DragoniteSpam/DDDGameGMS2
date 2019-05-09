/// @description  DataTrainer add_trainer(name, class, version, items, party);
/// @param name
/// @param  class
/// @param  version
/// @param  items
/// @param  party

with (instance_create(0, 0, DataTrainer)){
    name=argument[0];
    class=argument[1];
    version=argument[2];
    
    var item_array=argument[3];
    for (var i=0; i<array_length_1d(item_array); i++){
        trainer_add_item(id, item_array[i]);
    }
    
    var party_array=argument[4];
    for (var i=0; i<array_length_1d(party_array); i++){
        ds_list_add(party, party_array[i]);
    }
    
    return id;
}
