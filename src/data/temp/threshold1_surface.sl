surface threshold1_surface()
{
// START NODE P0 

point P0_outPoint = P;
// END NODE P0 

// START NODE moon0 
float moon0_ka = 0.500;
float moon0_kd = 1.000;
float moon0_lacunarity = 1.500;
float moon0_octaves = 8.000;
float moon0_H = 0.300;
color moon0_highlandColor = color(0.700,0.700,0.700);
color moon0_mariaBaseColor = color(0.875,0.087,0.077);
color moon0_mariaColor = color(0.100,0.100,0.100);
float moon0_arg22 = 1.000;
float moon0_arg23 = 0.300;
float moon0_highlandThreshold = -0.200;
float moon0_highlandAltitude = 0.001;
float moon0_mariaAltitude = 0.001;
float moon0_peakRad = 0.007;
float moon0_innerRad = 0.010;
float moon0_rimRad = 0.200;
float moon0_outerRad = 0.050;
float moon0_peakHt = 0.005;
float moon0_rimHt = 0.003;
float moon0_numRays = 8.000;
float moon0_rayFade = 1.000;

#define snoise(Pt) (2*noise(Pt) - 1)
#define DNoise(p) (2*(point noise(p)) - point(1,1,1))
#define VLNoise(Pt,moon0_scale) (snoise(Pt + moon0_scale*DNoise(Pt)))
#define TWOPI (6.28)

float moon0_radialDist;
point moon0_PP, moon0_PQ;
float moon0_l, moon0_a, moon0_o, moon0_i, moon0_omega;
float moon0_chaos;
color moon0_outColor;
float moon0_temp1;
point moon0_vv;
float moon0_uu, moon0_ht, moon0_freq, moon0_scale;
float moon0_lighten;
point moon0_NN;
float moon0_pd;  /* pole distance */
float moon0_rayDist;

moon0_PQ = P;
moon0_PP = P0_outPoint;
moon0_NN = normalize(N);
moon0_radialDist = sqrt(xcomp(moon0_PP)*xcomp(moon0_PP) + ycomp(moon0_PP)*ycomp(moon0_PP));
moon0_omega = pow (moon0_lacunarity, (-.5)-moon0_H);

moon0_l = 1;  moon0_o = 1;  moon0_a = 0;
for(moon0_i = 0;  moon0_i < moon0_octaves;  moon0_i += 1)
{
    moon0_a += moon0_o * snoise(moon0_l * moon0_PP);
    moon0_l *= moon0_lacunarity;
    moon0_o *= moon0_omega;
}
moon0_chaos = moon0_a;

moon0_outColor = 1;

moon0_temp1 = moon0_radialDist * moon0_arg22;
if(moon0_temp1 < 1)
    moon0_chaos -= moon0_arg23 * (1 - smoothstep(0, 1, moon0_temp1));

if (moon0_chaos > moon0_highlandThreshold) {
    moon0_PQ += moon0_chaos * moon0_highlandAltitude * moon0_NN;
    moon0_outColor += moon0_highlandColor * moon0_chaos;
}
else {
    moon0_PQ += moon0_chaos * moon0_mariaAltitude * moon0_NN;
    moon0_outColor *= moon0_mariaBaseColor + moon0_mariaColor * moon0_chaos;
}

moon0_pd = 1-v;
moon0_vv = point(xcomp(moon0_PP)/moon0_radialDist, 0, zcomp(moon0_PP)/moon0_radialDist);
moon0_lighten = 0;
if (moon0_pd < moon0_peakRad) {
    moon0_uu = 1 - moon0_pd/moon0_peakRad;
    moon0_ht = moon0_peakHt * smoothstep(0, 1, moon0_uu);
}
else if (moon0_pd < moon0_innerRad) { 
    moon0_ht = 0;
}
else if (moon0_pd < moon0_rimRad) {           
    moon0_uu = (moon0_pd-moon0_innerRad) / (moon0_rimRad - moon0_innerRad);
    moon0_lighten = .75*moon0_uu;
    moon0_ht = moon0_rimHt * smoothstep(0, 1, moon0_uu);
}
else if (moon0_pd < moon0_outerRad) {        
    moon0_uu = 1 - (moon0_pd-moon0_rimRad) / (moon0_outerRad-moon0_rimRad);
    moon0_lighten = .75*moon0_uu*moon0_uu;
    moon0_ht = moon0_rimHt * smoothstep(0, 1, moon0_uu*moon0_uu);
}
else moon0_ht = 0;

moon0_PQ += moon0_ht * moon0_NN;
moon0_lighten *= 0.2;
moon0_outColor += color(moon0_lighten,moon0_lighten,moon0_lighten);

if (moon0_uu > 0) {
    if (moon0_pd < moon0_peakRad) {     
        moon0_vv = 5*moon0_PP + 3 * moon0_vv;
        moon0_freq = 1;  moon0_scale = 1;  moon0_ht = 0;
        for (moon0_i = 0;  moon0_i < 4;  moon0_i += 1) {
          moon0_ht += moon0_scale * snoise(moon0_freq * moon0_vv);
          moon0_freq *= 2;  moon0_scale *= 0.833;
        }

        moon0_PQ += 0.0025 * moon0_uu*moon0_ht * moon0_NN;
	}
    else {
        moon0_vv = 6*moon0_PP + 3 * moon0_vv;
        moon0_freq = 1;  moon0_scale = 1;  moon0_ht = 0;
        for(moon0_i = 0;  moon0_i < 4;  moon0_i += 1)
        {
            moon0_ht += moon0_scale * snoise(moon0_freq * moon0_vv);
            moon0_freq *= 2;  moon0_scale *= 0.833;
        }
        if(moon0_radialDist > moon0_rimRad)
            moon0_uu *= moon0_uu;
        moon0_PQ += 0.0025 * (0.5*moon0_uu + 0.5*moon0_ht) * moon0_NN;
	}
}

moon0_lighten = 0;
if (moon0_pd >= moon0_rimRad  &&  moon0_pd < 0.4) {
    moon0_lighten = smoothstep (.15, .5, snoise(62*u));
    moon0_rayDist = 0.2 + 0.2 * snoise (20 * mod(u+0.022,1));
    moon0_lighten *= (1 - smoothstep (moon0_rayDist-.2, moon0_rayDist, moon0_pd));
}
moon0_lighten = 0.2 * clamp (moon0_lighten, 0, 1);
moon0_outColor += color (moon0_lighten, moon0_lighten, moon0_lighten);
// END NODE moon0 

// START NODE colorToFloat1 

float colorToFloat1_outFloat = (comp(moon0_outColor, 0) + comp(moon0_outColor, 1) + comp(moon0_outColor, 2)) / 3;
// END NODE colorToFloat1 

// START NODE threshold1 
float threshold1_threshold = 0.500;
float threshold1_fuzz = 0.500;

float threshold1_outValue = smoothstep(threshold1_threshold,
												  threshold1_threshold + threshold1_fuzz, 
												  colorToFloat1_outFloat);
// END NODE threshold1 

Ci = threshold1_outValue; Oi = 1.0;}
