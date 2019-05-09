/// @description  Pawn pawn_create(class internal name, name, [version], [object], [displayname]);
/// @param class internal name
/// @param  name
/// @param  [version]
/// @param  [object]
/// @param  [displayname]

var pname, pclass;
var pversion=1;
var pdisplayname="";
var ptype=Pawn;

switch (argument_count){
    case 5:
        pdisplayname=argument[6];
    case 4:
        ptype=argument[3];
    case 3:
        pversion=argument[2];
    case 2:
        pname=argument[1];
    case 1:
        // I don't like doing this but without a trainer types enum
        // it's going to be very difficult to do this, and I don't
        // want to use a trainer type enum because it would make
        // adding new data that much more annoying.
        // In the future, pawns will preferably be added through code
        // and you can bypass the trainer class names entirely.
        pclass=get_trainer_class_from_name(argument[0], true);
        break;
}

if (string_length(pdisplayname)==0){
    pdisplayname=get_trainer_class(pclass).name+" "+pname;
}

// todo in the future, non-trainer NPCs shouldn't have a need for a
// valid trainer class parameter.
var class_data=get_trainer_class(pclass);

with (instance_create(0, 0, ptype)){
    trainer_index=get_trainer_from_data(pname, pclass, pversion);

    if (trainer_index>-1){
        ds_list_copy(party, get_trainer(trainer_index).party);
    }
    
    name=pdisplayname;
    
    // defaults
    battle_sprite=get_class_battle_sprite(class_data.battle_sprite);
    overworld_sprite=get_class_overworld_sprite(class_data.overworld_sprite);
    // do audio later
    
    return id;
}
