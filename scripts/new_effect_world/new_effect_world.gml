/// @description  Effect2D new_effect_world(x, y, z, xrot, yrot, zrot, scale, sprite, render, t_fadein, t_still, t_fadeout, [xscale], [yscale], [rotation], [color], [alpha], [animation rate], [animation loop?], [xspeed], [yspeed], [zspeed], [damping]);
/// @param x
/// @param  y
/// @param  z
/// @param  xrot
/// @param  yrot
/// @param  zrot
/// @param  scale
/// @param  sprite
/// @param  render
/// @param  t_fadein
/// @param  t_still
/// @param  t_fadeout
/// @param  [xscale]
/// @param  [yscale]
/// @param  [rotation]
/// @param  [color]
/// @param  [alpha]
/// @param  [animation rate]
/// @param  [animation loop?]
/// @param  [xspeed]
/// @param  [yspeed]
/// @param  [zspeed]
/// @param  [damping]

with (instance_create(argument[0], argument[1], WorldEffect2D)){
    switch (argument_count){
        case 23:
            damping=argument[22];
        case 22:
            zspeed=argument[21];
        case 21:
            yspeed=argument[20];
        case 20:
            xspeed=argument[19];
        case 19:
            animation_loop=argument[18];
        case 18:
            animation_rate=argument[17];
        case 17:
            alpha=argument[16];
        case 16:
            color=argument[15];
        case 15:
            rotation=argument[14];
        case 14:
            yscale=argument[13];
        case 13:
            xscale=argument[12];
        default:
            z=argument[2];
            xrot=argument[3];
            yrot=argument[4];
            zrot=argument[5];
            scale=argument[6];
            sprite_index=argument[7];
            render=argument[8];
            t_fadein=argument[9];
            t_still=argument[10];
            t_fadeout=argument[11];
            break;
    }

    return id;
}
