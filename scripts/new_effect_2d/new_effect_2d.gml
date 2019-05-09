/// @description  Effect2D new_effect_2d(x, y, sprite, render, t_fadein, t_still, t_fadeout, [xscale], [yscale], [rotation], [color], [alpha], [animation rate], [animation_loop?], [xspeed], [yspeed], [damping]);
/// @param x
/// @param  y
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
/// @param  [animation_loop?]
/// @param  [xspeed]
/// @param  [yspeed]
/// @param  [damping]

with (instance_create(argument[0], argument[1], Effect2D)){
    switch (argument_count){
        case 17:
            damping=argument[16];
        case 16:
            yspeed=argument[15];
        case 15:
            xspeed=argument[14];
        case 14:
            animation_loop=argument[13];
        case 13:
            animation_rate=argument[12];
        case 12:
            alpha=argument[11];
        case 11:
            color=argument[10];
        case 10:
            rotation=argument[9];
        case 9:
            yscale=argument[8];
        case 8:
            xscale=argument[7];
        default:
            sprite_index=argument[2];
            render=argument[3];
            t_fadein=argument[4];
            t_still=argument[5];
            t_fadeout=argument[6];
            break;
    }

    return id;
}
