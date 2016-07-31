surface noiseF0_surface()
{
// START NODE P0 

point P0_outPoint = P;
// END NODE P0 

// START NODE noiseF0 
float noiseF0_freq = 40.000;

float noiseF0_noise = noise(P0_outPoint * noiseF0_freq);
// END NODE noiseF0 

Ci = noiseF0_noise; Oi = 1.0;}
