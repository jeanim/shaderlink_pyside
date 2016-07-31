surface multF1_surface()
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

Ci = multF1_outValue; Oi = 1.0;}
