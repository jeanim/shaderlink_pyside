surface P0_surface()
{
// START NODE P0 

point P0_outPoint = P;
// END NODE P0 

float xmin = -1, ymin = -1, zmin = -1, xmax = 1, ymax = 1, zmax = 1;
point scale, zero;
point objP, cubeP;

scale = point (1 / (xmax - xmin), 1 / (ymax - ymin), 
 1 / (zmax - zmin));
zero = point (xmin, ymin, zmin);

objP = transform ("shader", P);
cubeP = (objP - zero) * scale;

Ci = color(xcomp (cubeP), ycomp(cubeP), zcomp(cubeP) ); Oi = 1;}
