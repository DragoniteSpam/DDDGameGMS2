/// @description  array world_to_2d(targetx, targety, targetz);
/// @param targetx
/// @param  targety
/// @param  targetz

var xfrom=Camera.x;
var yfrom=Camera.y;
var zfrom=Camera.z;
var xto=argument0;
var yto=argument1;
var zto=argument2;

var dX = Camera.xto-Camera.x;
var dY = Camera.yto-Camera.y;
var dZ = Camera.zto-Camera.z;
var mm = sqrt(dX*dX + dY*dY + dZ*dZ);
dX /= mm;
dY /= mm;
dZ /= mm;
var uX = Camera.xup;
var uY = Camera.yup;
var uZ = Camera.zup;
mm = uX*dX + uY*dY + uZ*dZ;
uX -= mm*dX;
uY -= mm*dY;
uZ -= mm*dZ;
mm = sqrt(uX*uX + uY*uY + uZ*uZ);
uX /= mm;
uY /= mm;
uZ /= mm;
var tFOV = tan(Camera.fov*pi/360);
uX *= tFOV;
uY *= tFOV;
uZ *= tFOV;
var vX = uY*dZ - dY*uZ;
var vY = uZ*dX - dZ*uX;
var vZ = uX*dY - dX*uY;
vX *= W/H;
vY *= W/H;
vZ *= W/H;

pX = argument0 - xfrom;
pY = argument1 - yfrom;
pZ = argument2 - zfrom;
mm = pX*dX + pY*dY + pZ*dZ;

if (mm > 0){
    pX /= mm;
    pY /= mm;
    pZ /= mm;
} else {
    return vector2(0, 0);
}

var mmx = (pX*vX + pY*vY + pZ*vZ) / sqr((W/H)*tan(pi/8));
var mmy = (pX*uX + pY*uY + pZ*uZ) / sqr(tan(pi/8));

return vector2((mmx+1)/2*W, (1-mmy)/2*H);
