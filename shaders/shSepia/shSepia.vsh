// I'm pretty sure this is from xygthop3's shader collection, although
// the gms1 version of the marketplace is no longer around so it may be
// slightly different:
// https://marketplace.yoyogames.com/assets/261/free-shaders

attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_texcoord;

void main(){
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    v_texcoord = in_TextureCoord;
}
