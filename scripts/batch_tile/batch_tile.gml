/// @description  void batch_tile(vertex buffer, EntityTile, xx, yy, zz);
/// @param vertex buffer
/// @param  EntityTile
/// @param  xx
/// @param  yy
/// @param  zz

var map = get_active_map();
var ts_sprite = get_active_tileset().master;

var buffer = argument0;
var tile = argument1;
if (GMS_VERSION == 1){
    // see warning by tile_horizontal_count
    var TEXEL = 1 / sprite_get_width(ts_sprite);
} else {
    var TEXEL = 0;
}

var xx = argument2 * TILE_WIDTH;
var yy = argument3 * TILE_HEIGHT;
var zz = argument4 * TILE_DEPTH;
// todo correct normal calculation, and MAYBE normal smoothing, although
// i'm pretty sure that's going to be really expensive unless you bake it
// into the likely future map editing tool
var nx = 0;
var ny = 0;
var nz = 1;

// subject to change, and assuming each is square, which they don't have
// to be
var tile_size = 32;

// todo THIS IS THE SPRITE WIDTH/HEIGHT. texture_get_width will always
// be between 0 and 1. this may need to be addressed later, depending
// on how the map texture is arranged.
// 64 = 2048 / 32, most likely
var tile_horizontal_count = sprite_get_width(ts_sprite) / tile_size;
var tile_vertical_count = sprite_get_height(ts_sprite) / tile_size;

// texture coordinates go from 0...1, not 0...n, where n is the dimension
// of the image in pixels - 1 / 64
var texture_width = 1 / tile_horizontal_count;
var texture_height = 1 / tile_vertical_count;

var xtex = tile.tile_x * texture_width;
var ytex = tile.tile_y * texture_width;

var color = tile.tile_color;
var alpha = tile.tile_alpha;

// TEXEL Chops off the border around the tiles to prevent annoying
// single-pixel texture issues in GMS1. (Not a problem in GMS2.)
// This is not an optimal solution, but it works within the requirements
// of this project. Do not attempt at home.
vertex_point_complete(buffer, xx, yy, zz, nx, ny, nz, xtex + TEXEL, ytex + TEXEL, color, alpha);
vertex_point_complete(buffer, xx + TILE_WIDTH, yy, zz, nx, ny, nz, xtex + texture_width - TEXEL, ytex + TEXEL, color, alpha);
vertex_point_complete(buffer, xx + TILE_WIDTH, yy + TILE_HEIGHT, zz, nx, ny, nz, xtex + texture_width - TEXEL, ytex + texture_height - TEXEL, color, alpha);

vertex_point_complete(buffer, xx + TILE_WIDTH, yy + TILE_HEIGHT, zz, nx, ny, nz, xtex + texture_width - TEXEL, ytex + texture_height - TEXEL, color, alpha);
vertex_point_complete(buffer, xx, yy + TILE_HEIGHT, zz, nx, ny, nz, xtex + TEXEL, ytex + texture_height - TEXEL, color, alpha);
vertex_point_complete(buffer, xx, yy, zz, nx, ny, nz, xtex + TEXEL, ytex + TEXEL, color, alpha);
