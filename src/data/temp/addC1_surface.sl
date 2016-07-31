surface addC1_surface()
{
// START NODE normalizeN0 

vector normalizeN0_outV = normalize(N);
// END NODE normalizeN0 

// START NODE normalizeI0 

vector normalizeI0_outV = normalize(I);
// END NODE normalizeI0 

// START NODE reflect0 

vector reflect0_outVector = reflect(normalizeI0_outV, normalizeN0_outV);
// END NODE reflect0 

// START NODE P0 

point P0_outPoint = P;
// END NODE P0 

// START NODE trace0 

color trace0_outColor = trace(P0_outPoint, reflect0_outVector);
// END NODE trace0 

// START NODE blinn0 
color blinn0_SurfaceColor = color(0.000,0.500,1.000);
float blinn0_diffuseCoeff = 0.800;
color blinn0_ambientColor = color(0.000,0.000,0.000);
color blinn0_incandescence = color(0.000,0.000,0.000);
float blinn0_translucence = 0.000;
color blinn0_specularColor = color(0.500,0.500,0.500);
float blinn0_eccentricity = 0.300;
float blinn0_specularRollOff = 0.700;

 normal blinn0_Nf;
 vector blinn0_H, blinn0_Ln, blinn0_V;
 color blinn0_Ia, blinn0_Id, blinn0_Itr, blinn0_Is;
 float blinn0_NH, blinn0_NH2, blinn0_NHSQ, blinn0_Dd, blinn0_Gg, blinn0_VN, blinn0_VH, blinn0_LN, blinn0_Ff, blinn0_tmp;
 float blinn0_E= 1 / (blinn0_eccentricity * blinn0_eccentricity- 1);
  
 blinn0_Nf= faceforward(normalize(N), I);
 blinn0_Ia= ambient() + blinn0_ambientColor;
 blinn0_Id= blinn0_diffuseCoeff* diffuse(blinn0_Nf);
 
 blinn0_Itr= 0;
 if (blinn0_translucence!= 0) {
  illuminance(P, blinn0_Nf, PI)
  blinn0_Itr+= Cl;
  blinn0_Itr*= blinn0_translucence;
 }
 
 blinn0_Is= 0;
 blinn0_V= normalize(-I);
 blinn0_VN= blinn0_V.blinn0_Nf;
 illuminance(P, blinn0_Nf, PI * 0.5) {
  blinn0_Ln= normalize(L);
  blinn0_H= normalize(blinn0_Ln+blinn0_V);
  blinn0_NH= blinn0_Nf.blinn0_H;
  blinn0_NHSQ= blinn0_NH*blinn0_NH;
  blinn0_NH2= blinn0_NH* 2;
  blinn0_Dd= (blinn0_E+1) / (blinn0_NHSQ+ blinn0_E);
  blinn0_Dd*= blinn0_Dd;
  blinn0_VH= blinn0_V.blinn0_H;
  blinn0_LN= blinn0_Ln.blinn0_Nf;
  if (blinn0_VN < blinn0_LN) {
   if (blinn0_VN* blinn0_NH2 < blinn0_VH)
   blinn0_Gg= blinn0_NH2/ blinn0_VH;
   else
   blinn0_Gg= 1 / blinn0_VN;
   }
  else {
   if (blinn0_LN* blinn0_NH2 < blinn0_VH)
   blinn0_Gg= (blinn0_LN* blinn0_NH2) / (blinn0_VH* blinn0_VN);
  else
  blinn0_Gg= 1 / blinn0_VN;
 }
 blinn0_tmp= pow((1 - blinn0_VH), 3);
 blinn0_Ff= blinn0_tmp+ (1 - blinn0_tmp) * blinn0_specularRollOff;
 blinn0_Is+= Cl * blinn0_Dd* blinn0_Gg* blinn0_Ff;
 }
 blinn0_Is*= blinn0_specularColor;
 
 color blinn0_outColor= blinn0_SurfaceColor* (blinn0_Ia + blinn0_Id + blinn0_Itr + blinn0_incandescence+ blinn0_Is);
// END NODE blinn0 

// START NODE addC1 

color addC1_outColor = blinn0_outColor + trace0_outColor;
// END NODE addC1 

Ci = addC1_outColor; Oi = 1.0;}
