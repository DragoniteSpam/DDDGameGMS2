/// @description  array const_mesh_next(buffer, grid size);
/// @param buffer
/// @param  grid size
// the array that is returned takes the form of
// [vbuff, buff, xmin, ymin, zmin, xmax, ymax, zmax]

var n=buffer_read(argument0, T);

var buffer=vertex_create_buffer();
var data=buffer_create(n*4*10, buffer_fixed, 4);
vertex_begin(buffer, World.vertex_format);

repeat(n){
    var xx=buffer_read(argument0, T);
    var yy=buffer_read(argument0, T);
    var zz=buffer_read(argument0, T);
    var nx=buffer_read(argument0, T);
    var ny=buffer_read(argument0, T);
    var nz=buffer_read(argument0, T);
    // the tileset only takes up a quarter (1/2*1/2) of the main texture and so the texture
    // coordinates for meshes have to be divided in half. if the tileset sizes are allowed
    // to be different values than 2048x2048 later this will need to be addressed here.
    var xtex=buffer_read(argument0, T)/2;
    var ytex=buffer_read(argument0, T)/2;
    var color=buffer_read(argument0, T);
    var alpha=buffer_read(argument0, T);
    
    vertex_point_complete(buffer, xx, yy, zz, nx, ny, nz, xtex, ytex, color, alpha);
    buffer_point_complete(data, xx, yy, zz, nx, ny, nz, xtex, ytex, color, alpha);
}

var xmin=0;
var ymin=0;
var zmin=0;
var xmax=0;
var ymax=0;
var zmax=0;

if (argument1>0){
    xmin=buffer_read(argument0, T);
    ymin=buffer_read(argument0, T);
    zmin=buffer_read(argument0, T);
    xmax=buffer_read(argument0, T);
    ymax=buffer_read(argument0, T);
    zmax=buffer_read(argument0, T);
}

vertex_end(buffer);

// it's really annoying, but you can't convert frozen vertex buffers
// to normal buffers, and you need to do that to access the information
// inside the vertex buffer in order to batch static objects together.

// for now save both the vertex buffer and the ordinary buffer. it uses
// more memory but the only alternative that i can think of is reloading
// all of the meshes every time you enter a new map, which i don't think
// anyone wants to do.

// in any case it turns out reading data from vertex buffers is haaaaard.

// todo ask TheSnidr about this, and about how to read data out of a
// converted vertex buffer, because thatll probably be easier?

vertex_freeze(buffer);

return array_compose(buffer, data, xmin, ymin, zmin, xmax, ymax, zmax);

enum MeshArrayData {
    VBUFF,
    DATA,
    XMIN,
    YMIN,
    ZMIN,
    XMAX,
    YMAX,
    ZMAX
}
