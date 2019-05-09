if (following!=noone){
    xto=following.xx*TILE_WIDTH;
    yto=following.yy*TILE_HEIGHT;
    zto=following.zz*TILE_DEPTH;
    
    // if you want to do fancy camera movement you probably want
    // to edit this part
    x=xto;
    y=yto+following_distance*dcos(following_angle);
    z=zto+following_distance*dsin(following_angle);
}
