surface displacement0_surface()
{
// START NODE displacement0 
point displacement0_P = point(0.000,0.000,0.000);
normal displacement0_N = normal(1.000,0.000,0.000);

P = displacement0_P; N = displacement0_N;
// END NODE displacement0 

float previewKd = 0.8; float previewKa = 0.2; string texturename = "";
float diffuse = I.N;
diffuse = (diffuse*diffuse) / (I.I * N.N);

color texturecolor = ( texturename != "" ) ? texture( texturename ) : 1;

Ci = Cs * ( previewKa + previewKd*diffuse ) * texturecolor;
Oi = Os;

Ci *= Oi;}
