/// @description  DataMove add_nature(name, hp, atk, def, spam spd, spe);
/// @param name
/// @param  hp
/// @param  atk
/// @param  def
/// @param  spam spd
/// @param  spe
// if you want to do like contest stats or something you might want to modify this script

with (instance_create(0, 0, DataNature)){
    name=argument[0];
    
    // game maker doesn't like you using the argument array
    // like this apparently
    //array_copy(affects, 0, argument, 1, 6);
    
    for (var i=0; i<6; i++){
        affects[i]=argument[i+1];
    }
    
    return id;
}
