/// @description  void draw_major_status(status, x, y);
/// @param status
/// @param  x
/// @param  y

var w=sprite_get_width(spr_major_status);
var offset=sprite_get_yoffset(spr_major_status);

if (argument0==MajorStatus.TOXIC){
    // In Gen V+ the letters in the 'badly poisoned' status symbol
    // are dark purple instead of white. You can make a separate
    // 'badly poisoned' symbol if you want. I think it's ugly so
    // I won't be doing it though.
    argument0=MajorStatus.POISON;
} else if (argument0==MajorStatus.NONE){
    return 0;
}

draw_sprite_part(spr_major_status, 0, 0, argument0*offset*2, w, offset*2, argument1, argument2-offset);
