/// @description  void draw_type(type, x, y);
/// @param type
/// @param  x
/// @param  y

var w=sprite_get_width(spr_move_type);
var offset=sprite_get_yoffset(spr_move_type);

// this draws correctly on the assumption that the yoffset of the sprite
// is in the middle of what would be the first frame if this was a conventional
// Game Maker sprite.
draw_sprite_part(spr_move_type, 0, 0, argument0*offset*2, w, offset*2, argument1, argument2-offset);
