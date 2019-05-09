/// @description  void draw_move_category(category, x, y);
/// @param category
/// @param  x
/// @param  y

var w=sprite_get_width(spr_move_category);
var offset=sprite_get_yoffset(spr_move_category);

// this is a fix for the 'solution' i came up with for the problem
// of moves dealing damage that aren't their designated category,
// and by that i mean psyshock and psystrke and i think that's it.
switch (argument0){
    case MoveCategories.PHYSICAL_ATK_SPECIAL_DEF:
        argument0=MoveCategories.PHYSICAL;
        break;
    case MoveCategories.SPECIAL_ATK_PHYSICAL_DEF:
        argument0=MoveCategories.SPECIAL;
        break;
}

// this draws correctly on the assumption that the yoffset of the sprite
// is in the middle of what would be the first frame if this was a conventional
// Game Maker sprite.
draw_sprite_part(spr_move_category, 0, 0, argument0*offset*2, w, offset*2, argument1, argument2-offset);
