surface multFC1_surface()
{
// START NODE P0 

point P0_outPoint = P;
// END NODE P0 

// START NODE marble0 
color marble0_inColor1 = color(0.667,0.333,0.000);
color marble0_inColor2 = color(0.000,0.667,0.000);
float marble0_veining = 1.800;

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

// START NODE colorToFloat0 

float colorToFloat0_outFloat = (comp(marble0_outColor, 0) + comp(marble0_outColor, 1) + comp(marble0_outColor, 2)) / 3;
// END NODE colorToFloat0 

// START NODE threshold0 
float threshold0_threshold = 0.360;
float threshold0_fuzz = 0.300;

float threshold0_outValue = smoothstep(threshold0_threshold,
												  threshold0_threshold + threshold0_fuzz, 
												  colorToFloat0_outFloat);
// END NODE threshold0 

// START NODE floatToColor0 

color floatToColor0_outColor = color(threshold0_outValue, threshold0_outValue, threshold0_outValue);
// END NODE floatToColor0 

// START NODE invertColor0 

color invertColor0_invertedColor = color(1 - comp(floatToColor0_outColor, 0),
												  1 - comp(floatToColor0_outColor, 1),
												  1 - comp(floatToColor0_outColor, 2));
// END NODE invertColor0 

// START NODE multFC0 
float multFC0_inValue1 = 0.400;

color multFC0_outValue = multFC0_inValue1 * invertColor0_invertedColor;
// END NODE multFC0 

// START NODE noiseF1 
float noiseF1_freq = 200.000;

float noiseF1_noise = noise(P0_outPoint * noiseF1_freq);
// END NODE noiseF1 

// START NODE multF0 
float multF0_inValue2 = 4.000;

float multF0_outValue = noiseF1_noise * multF0_inValue2;
// END NODE multF0 

// START NODE multFC1 

color multFC1_outValue = multF0_outValue * multFC0_outValue;
// END NODE multFC1 

Ci = multFC1_outValue; Oi = 1.0;}
