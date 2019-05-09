/// @description  bool load_entity_pawn(buffer, Entity, version);
/// @param buffer
/// @param  Entity
/// @param  version

var static=load_entity(argument0, argument1, argument2);

argument1.map_direction=buffer_read(argument0, buffer_u8);

return static;
