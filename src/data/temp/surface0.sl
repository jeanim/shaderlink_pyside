surface surface0()
{
// START NODE P0 

point P0_outPoint = P;
// END NODE P0 

// START NODE marble0 
color marble0_inColor1 = color(0.800,0.200,0.050);
color marble0_inColor2 = color(0.000,0.000,1.000);
float marble0_veining = 1.500;

#define snoise(x)    (noise(x) * 2 - 1)
#define MINFILTERWIDTH  1e-7
#define filterwidth_point(p) (max(sqrt(area(p)), MINFILTERWIDTH))
#define blend(a,b,x) ((a) * (1 - (x)) + (b) * (x))

color marble0_outColor;

color marble0_surfaceColor, marble0_layerColor;
color marble0_layerOpac;
point marble0_PP;
vector marble0_V;
normal marble0_Nf ;
float marble0_width, marble0_cutoff, marble0_fade, marble0_f, marble0_turb, marble0_maxfreq = 16;

/* init */
marble0_surfaceColor = 0;

marble0_Nf = faceforward(normalize(N), I);
marble0_V = -normalize(I);

/* compute turbulence */
marble0_PP = P0_outPoint * marble0_veining;

marble0_width = filterwidth_point(marble0_PP);
marble0_cutoff = clamp(0.5 / marble0_width, 0, marble0_maxfreq);

marble0_turb = 0;
for(marble0_f = 1; marble0_f < 0.5 * marble0_cutoff; marble0_f *= 2) 
    marble0_turb += abs(snoise(marble0_PP * marble0_f)) / marble0_f;
marble0_fade = clamp(2 * (marble0_cutoff - marble0_f) / marble0_cutoff, 0, 1);
marble0_turb += marble0_fade * abs(snoise(marble0_PP * marble0_f)) / marble0_f;

marble0_turb *= 0.5;  /* to match original rmarble turbulence value */

/* use turb to index into spline for layer color */

float marble0_r = comp(marble0_inColor1, 0);
float marble0_g = comp(marble0_inColor1, 1);
float marble0_b = comp(marble0_inColor1, 2);

marble0_layerColor = spline(marble0_turb,
        		       marble0_inColor1,
        		       marble0_inColor1,
        		       color(marble0_r, marble0_g+0.3, marble0_b+0.25),
        		       color(marble0_r-0.2, marble0_g+0.394, marble0_b+0.53),
        		       color(marble0_r-0.5, marble0_g+0.1, marble0_b+0.35),
        		       color(marble0_r-0.75, marble0_g+0.15, marble0_b+0.05),
        		       marble0_inColor2,
        		       marble0_inColor2); 
		       
marble0_layerOpac = 1;
marble0_surfaceColor = blend(marble0_surfaceColor, marble0_layerColor, marble0_layerOpac);

marble0_outColor = marble0_surfaceColor;
// END NODE marble0 

// START NODE s0 

float s0_s = s;
// END NODE s0 

// START NODE t0 

float t0_t = t;
// END NODE t0 

// START NODE voronoi2d0 
float voronoi2d0_freq = 20.000;
float voronoi2d0_jitter = 1.000;

float voronoi2d0_f1;
float voronoi2d0_pos_s;
float voronoi2d0_pos_t;

point voronoi2d0_P = point(s0_s*voronoi2d0_freq, t0_t*voronoi2d0_freq, 0);
point voronoi2d0_thiscell = point(floor(s0_s*voronoi2d0_freq)+0.5, floor(t0_t*voronoi2d0_freq)+0.5, 0);

voronoi2d0_f1 = voronoi2d0_freq+1;
uniform float voronoi2d0_i, voronoi2d0_j;
for (voronoi2d0_i=-1; voronoi2d0_i<=1; voronoi2d0_i+=1)
{
    for (voronoi2d0_j=-1; voronoi2d0_j<=1; voronoi2d0_j+=1)
    {
        point voronoi2d0_testcell = voronoi2d0_thiscell + vector(voronoi2d0_i, voronoi2d0_j, 0);
        point voronoi2d0_pos = voronoi2d0_testcell + voronoi2d0_jitter*(vector cellnoise(voronoi2d0_testcell) - 0.5);
        vector voronoi2d0_offset = voronoi2d0_pos - voronoi2d0_P;
        float voronoi2d0_dist = voronoi2d0_offset.voronoi2d0_offset;

        if (voronoi2d0_dist < voronoi2d0_f1)
        {
            voronoi2d0_f1 = voronoi2d0_dist;
            voronoi2d0_pos_s = xcomp(voronoi2d0_pos);
            voronoi2d0_pos_t = ycomp(voronoi2d0_pos);      
        }
    }
}

voronoi2d0_pos_s /= voronoi2d0_freq;
voronoi2d0_pos_t /= voronoi2d0_freq;

voronoi2d0_f1 = sqrt(voronoi2d0_f1);
// END NODE voronoi2d0 

// START NODE floatToColor0 

color floatToColor0_outColor = color(voronoi2d0_f1, voronoi2d0_f1, voronoi2d0_f1);
// END NODE floatToColor0 

// START NODE mixC0 
float mixC0_factor = 0.250;

color mixC0_outColor = mix((marble0_outColor), (floatToColor0_outColor), (mixC0_factor));
// END NODE mixC0 

// START NODE blinn0 
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
 
 color blinn0_outColor= mixC0_outColor* (blinn0_Ia + blinn0_Id + blinn0_Itr + blinn0_incandescence+ blinn0_Is);
// END NODE blinn0 

// START NODE surface0 
color surface0_Oi = color(1.000,1.000,1.000);

Ci = blinn0_outColor; Oi = surface0_Oi;
// END NODE surface0 

}
