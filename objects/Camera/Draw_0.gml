/// @description  3D stuff

d3d_start();
d3d_set_culling(true);
d3d_set_hidden(true);

// todo GMS2 requires smooth shading to be handled by the shader(s) now,
// so to make porting this to GMS2 as pain-free as possible I'd like to
// do it that way here at some point in the future too

draw_set_color(c_white);

d3d_set_projection_ext(x, y, z,
    xto, yto, zto,
    xup, yup, zup,
    fov, W/H, 1, 1000);

//vertex_submit(World.model_floor, pr_trianglelist, sprite_get_texture(b_tex_temp, 0));
// todo draw selectively based on the global mode (overworld, battle, something else)

var map=get_active_map();

vertex_submit(map.statics, pr_trianglelist, get_active_texture());
// textures need to be on the same texture if you want to batch them together.
// later you should be able to swap out the tileset but for now just assume
// that there's only one (which there is).

for (var i=0; i<ds_list_size(map.list_dynamic); i++){
    var ent=map.list_dynamic[| i];
    script_execute(ent.render, ent, ent.xx, ent.yy, ent.zz);
}

// i suppose you could also just say with (BattleDrawable) but it's possible that
// you want some of them to be hidden or something
/*
for (var i=0; i<ds_list_size(Battle.drawables); i++){
    with (Battle.drawables[| i]){
        bg_draw_drawable();
    }
}

with (BattleAnimator){
    script_execute(script);
}
*/
/*
 * less-important effects go on top of everything else because the depth buffer is weird
 */

with (WorldEffect){
    script_execute(render);
}

/* */
/*  */
