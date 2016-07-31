surface noiseF1_surface()
{
// START NODE P0 

point P0_outPoint = P;
// END NODE P0 

// START NODE noiseF1 
float noiseF1_freq = 200.000;

float noiseF1_noise = noise(P0_outPoint * noiseF1_freq);
// END NODE noiseF1 

Ci = noiseF1_noise; Oi = 1.0;}
