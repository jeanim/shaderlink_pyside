surface powF2_surface()
{
// START NODE toon0 
float toon0_Ka = 0.250;
float toon0_Kd = 0.670;
float toon0_Ks = 35.000;
float toon0_roughness = 0.080;
color toon0_specularcolor = color(1.000,1.000,1.000);
color toon0_paint_color = color(0.000,0.500,1.000);
float toon0_paint_spec = 0.920;
float toon0_paint_trans = 0.350;
float toon0_paint_fuzz = 0.025;
float toon0_ink_thresh = 0.230;
float toon0_ink_fuzz = 0.020;
color toon0_ink_color = color(0.050,0.050,0.050);

#define blend(a,b,x) ((a) * (1 - (x)) + (b) * (x))
#define union(a,b)        ((a) + (b) - (a) * (b))

float
toonspec(vector N, V; float roughness)
{
  float C = 0;
  vector H;

  illuminance(P, N, PI/2) {
    H = normalize(normalize(L)+V);
    C += pow(N.H, 1/roughness);
  }
  return C;
}

  float toon0_cos_here;
  float toon0_diff, toon0_spec;
  normal toon0_Nf;
  vector toon0_normI, toon0_half;

  color toon0_toon_color, toon0_layer_color;
  color toon0_toon_opac, toon0_layer_opac;

  toon0_Nf= faceforward(normalize(N), I);
  toon0_normI= normalize(I);

  /* background layer (layer 0) */
  toon0_toon_color= color (0, 0, 0);
  toon0_toon_opac= Os;

  /* toon paint (layer 1) */

  /* only care about percentage illumination */
  toon0_diff= 0;
  illuminance(P, toon0_Nf, PI/2)
  toon0_diff+= normalize(L).toon0_Nf; 

  /* antialias the transition */
  toon0_diff= smoothstep(toon0_paint_trans- toon0_paint_fuzz/2, toon0_paint_trans+ toon0_paint_fuzz/2, toon0_diff);

  /* specular -- transition also antialiased */  
  toon0_spec= toonspec(toon0_Nf, -normalize(I), toon0_roughness);
  toon0_spec= smoothstep(toon0_paint_spec- toon0_paint_fuzz/2, toon0_paint_spec+ toon0_paint_fuzz/2, toon0_spec);

  toon0_layer_color= Cs*(toon0_Kd*toon0_diff*toon0_paint_color+ toon0_Ka*ambient()) + toon0_specularcolor*toon0_Ks*toon0_spec;
  toon0_layer_opac= Os;

  toon0_toon_color= blend(toon0_toon_color, toon0_layer_color, toon0_layer_opac);
  toon0_toon_opac=  union(toon0_toon_opac, toon0_layer_opac);

  /* toon ink (layer 3) */
  
  toon0_cos_here= normalize(toon0_Nf).toon0_normI;

  /* antialias ink lines */
  toon0_layer_opac= 1 - smoothstep(toon0_ink_thresh- toon0_ink_fuzz/2, toon0_ink_thresh+ toon0_ink_fuzz/2, abs(toon0_cos_here));
  
  if (abs(toon0_cos_here) < toon0_ink_thresh)
    toon0_layer_color= toon0_ink_color;
  else
    toon0_layer_color= 0;
  
  toon0_toon_color= blend(toon0_toon_color, toon0_layer_color, toon0_layer_opac);
  toon0_toon_opac=  union(toon0_toon_opac, toon0_layer_opac);

  color toon0_toonOi= toon0_toon_opac;
  color toon0_toonCi= toon0_toon_opac* toon0_toon_color;
// END NODE toon0 

// START NODE compC0 

float compC0_red= comp(toon0_toonCi, 0);
	float compC0_green= comp(toon0_toonCi, 1);
	float compC0_blue= comp(toon0_toonCi, 2);
// END NODE compC0 

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

// START NODE powF2 

float powF2_outValue = pow(compC0_blue, compC1_blue);
// END NODE powF2 

Ci = color(powF2_outValue, powF2_outValue, powF2_outValue); Oi = 1.0;}
