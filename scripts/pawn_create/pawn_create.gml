/// @description  Pawn pawn_create(entity, name, [object], [sentient]);
/// @param entity guid
/// @param  name
/// @param  [object]
/// @param [sentient]

var ptype = Pawn;
var pname, pguid, psentient;

switch (argument_count){
    case 4:
        psentient = argument[3];
    case 3:
        ptype = argument[2];
    default:
        pname = argument[1];
        pguid = argument[0];
        break;
}

with (instance_create(0, 0, ptype)){
    consicousness = guid_get(pguid);
    
    name = pname;
    sentient = psentient;
    
    return id;
}