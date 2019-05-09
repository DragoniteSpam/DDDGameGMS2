singleton();

fov=45;

x=0;
y=BATTLEFIELD_SIZE;
z=BATTLEFIELD_SIZE;

xto=x;
yto=0;
zto=0;

xup=0;
yup=0;
zup=1;

// who you follow around on the overworld and look over the shoulder
// of in battle. should be an instance of Entity if you don't want
// things to break, preferably an instance of Pawn, and even more
// preferably PawnPlayer.
following=noone;
following_distance=8*TILE_HEIGHT;
following_angle=45;
// THEORETICALLY - and this is a really big 'theoretically' -
// you could make this a multiplayer game and each client would
// be able to play the right animation and poll the right contestant
// for input based on this variable.

// In practice, this is never going to happen.

