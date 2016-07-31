surface multF0_surface()
{
// START NODE P0 

point P0_outPoint = P;
// END NODE P0 

// START NODE noiseF1 
float noiseF1_freq = 200.000;

float noiseF1_noise = noise(P0_outPoint * noiseF1_freq);
// END NODE noiseF1 

// START NODE multF0 
float multF0_inValue2 = 4.000;

float multF0_outValue = noiseF1_noise * multF0_inValue2;
// END NODE multF0 

Ci = multF0_outValue; Oi = 1.0;}
