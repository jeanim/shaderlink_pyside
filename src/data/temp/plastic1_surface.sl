surface plastic1_surface()
{
// START NODE P0 

point P0_outPoint = P;
// END NODE P0 

// START NODE noiseF0 
float noiseF0_freq = 40.000;

float noiseF0_noise = noise(P0_outPoint * noiseF0_freq);
// END NODE noiseF0 

// START NODE multF1 
float multF1_inValue2 = 0.800;

float multF1_outValue = noiseF0_noise * multF1_inValue2;
// END NODE multF1 

// START NODE plastic1 
color plastic1_inColor = color(0.090,0.957,0.220);
float plastic1_inOpacity = 1.000;
color plastic1_specColor = color(1.000,1.000,1.000);
float plastic1_ka = 1.000;
float plastic1_kd = 0.500;
float plastic1_roughness = 0.100;

normal plastic1_Nf = faceforward(normalize(N), I);
color plastic1_outColor = plastic1_inColor * (plastic1_ka * ambient() +
                    plastic1_kd * diffuse(plastic1_Nf)) + plastic1_specColor * multF1_outValue *
                    specular(plastic1_Nf, -normalize(I), plastic1_roughness);
float plastic1_outOpacity = plastic1_inOpacity;
plastic1_outColor *= plastic1_outOpacity;
// END NODE plastic1 

Ci = plastic1_outColor; Oi = plastic1_outOpacity;}
