surface surface0_surface()
{
// START NODE t0 

float t0_t = t;
// END NODE t0 

// START NODE s0 

float s0_s = s;
// END NODE s0 

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

// START NODE P0 

point P0_outPoint = P;
// END NODE P0 

// START NODE noiseF0 
float noiseF0_freq = 45.000;

float noiseF0_noise = noise(P0_outPoint * noiseF0_freq);
// END NODE noiseF0 

// START NODE mixC0 
color mixC0_inColor2 = color(0.800,1.000,0.200);

color mixC0_outColor = mix((floatToColor0_outColor), (mixC0_inColor2), (noiseF0_noise));
// END NODE mixC0 

// START NODE plastic0 
float plastic0_inOpacity = 1.000;
color plastic0_specColor = color(1.000,1.000,1.000);
float plastic0_ka = 1.000;
float plastic0_kd = 0.500;
float plastic0_ks = 0.500;
float plastic0_roughness = 0.100;

normal plastic0_Nf = faceforward(normalize(N), I);
color plastic0_outColor = mixC0_outColor * (plastic0_ka * ambient() +
                    plastic0_kd * diffuse(plastic0_Nf)) + plastic0_specColor * plastic0_ks *
                    specular(plastic0_Nf, -normalize(I), plastic0_roughness);
float plastic0_outOpacity = plastic0_inOpacity;
plastic0_outColor *= plastic0_outOpacity;
// END NODE plastic0 

// START NODE floatToColor1 

color floatToColor1_outColor = color(plastic0_outOpacity, plastic0_outOpacity, plastic0_outOpacity);
// END NODE floatToColor1 

// START NODE surface0 

Ci = plastic0_outColor; Oi = floatToColor1_outColor;
// END NODE surface0 

}
