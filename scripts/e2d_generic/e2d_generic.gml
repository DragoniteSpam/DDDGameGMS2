// todo support for alpha fades that dont go 0..1?

if (t<t_fadein){
    alpha=alpha+World.dt/t_fadein;
} else if (t<t_still){
    alpha=1;
} else if (t<t_fadeout){
    alpha=alpha-World.dt/(t_fadeout-t_still);
} else {
    alpha=0;
    instance_destroy(/*self*/);
}

// for some reason this doesn't work well (or at all) with negative xscale. you should
// probably figure that one sooner or later.
draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, rotation, color, alpha);

if (animation_loop){
    image_index=(image_index+animation_rate*World.dt)%image_number;
} else {
    image_index=min(image_number-1, image_index+animation_rate*World.dt);
}

x=x+xspeed*World.dt;
y=y+yspeed*World.dt;

xspeed=xspeed*(1-damping*World.dt);
yspeed=yspeed*(1-damping*World.dt);

t=t+World.dt;
