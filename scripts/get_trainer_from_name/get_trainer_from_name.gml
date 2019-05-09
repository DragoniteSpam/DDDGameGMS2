/// @description  int get_trainer_from_name(name, class name, [version]);
/// @param name
/// @param  class name
/// @param  [version]
// if you already know the class index use get_trainer_from_data instead

// it's unlikely that any additional parameters are going to be added to this so
// i'm not going to write out the switch tree
if (argument_count==2){
    var version=1;
} else {
    var version=argument[2];
}

return get_trainer_from_data(argument[0], get_trainer_class_from_name(argument[1]), version);
