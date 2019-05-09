/// @description  int get_trainer_from_data(name, class id, [version]);
/// @param name
/// @param  class id
/// @param  [version]
// if you don't know the class index use get_trainer_from_name instead

var name=string_minimal(argument[0]);
var class=argument[1];
var version=1;

switch (argument_count){
    case 3:
        version=argument[2];
    default:
        break;
}

for (var i=0; i<array_length_1d(World.all_trainers); i++){
    if (string_minimal(World.all_trainers[i].name)==name&&World.all_trainers[i].class==class&&World.all_trainers[i].version==version){
        return i;
    }
}

return -1;
