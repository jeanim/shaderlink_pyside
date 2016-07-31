surface compC1_surface()
{
// START NODE lambert0 
color lambert0_SurfaceColor = color(0.000,0.500,1.000);
float lambert0_diffuseCoeff = 0.800;
color lambert0_ambientColor = color(0.000,0.000,0.000);
color lambert0_incandescence = color(0.000,0.000,0.000);
float lambert0_translucence = 0.000;

 normal lambert0_Nf= faceforward( normalize(N), I );
 vector lambert0_V= -normalize(I);
 color lambert0_Ia= ambient() + lambert0_ambientColor;
 color lambert0_Id= lambert0_diffuseCoeff* diffuse(lambert0_Nf);
 
 color lambert0_Itr= 0;
 if (lambert0_translucence!= 0) {
  illuminance(P, lambert0_Nf, PI)
  lambert0_Itr+= Cl;
  lambert0_Itr*= lambert0_translucence;
 }
 
 color lambert0_outColor= lambert0_SurfaceColor * (lambert0_Ia+ lambert0_Id+ lambert0_Itr+ lambert0_incandescence);
 
// END NODE lambert0 

// START NODE compC1 

float compC1_red= comp(lambert0_outColor, 0);
	float compC1_green= comp(lambert0_outColor, 1);
	float compC1_blue= comp(lambert0_outColor, 2);
// END NODE compC1 

Ci = color(compC1_red, compC1_green, compC1_blue); Oi = 1.0;}
