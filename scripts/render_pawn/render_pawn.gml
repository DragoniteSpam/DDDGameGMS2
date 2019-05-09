/// @description  void render_pawn(Pawn, xx, yy, zz);
/// @param Pawn
/// @param  xx
/// @param  yy
/// @param  zz

var pawn=argument0;
var xx=argument1;
var yy=argument2;
var zz=argument3;

var spritesheet_height=4;
var spritesheet_frames=4;
// if you're off the grid you want to start the walk cycle immediately, but if you're off the grid you don't
if (World.game_player_grid){
    var frame=floor(pawn.frame)%spritesheet_frames;
} else {
    var frame=ceil(pawn.frame)%spritesheet_frames;
}
// if you're on the grid you don't need to do the modulo thing because it'll reset at the end of each walk cycle, but on the grid you do
var dir=pawn.map_direction;
var frame_width=sprite_get_width(pawn.overworld_sprite)/spritesheet_frames;
var frame_height=sprite_get_height(pawn.overworld_sprite)/spritesheet_height;

// this took me two days to sort out because i'm dumb so you'd all
// better appreciate it
var angle=45;
// move the sprite up so it can pivot around the X axis
transform_set(0, -frame_height, 0, 0, 0, 0, 1, 1, 1);
// rotate the sprite around the X axis
transform_add(0, 0, 0, angle, 0, 0, 1, 1, 1);
// move to the correct location
transform_add(xx*TILE_WIDTH, (yy+0.5)*TILE_HEIGHT, zz*TILE_DEPTH, 0, 0, 0, 1, 1, 1);

draw_sprite_part(pawn.overworld_sprite, 0, frame*frame_width, dir*frame_height, frame_width, frame_height, 0, 0);

transform_reset();
