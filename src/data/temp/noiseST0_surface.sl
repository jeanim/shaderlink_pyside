surface noiseST0_surface()
{
// START NODE s0 

float s0_s = s;
// END NODE s0 

// START NODE noiseST0 
float noiseST0_t = 15.000;
float noiseST0_freq = 25.000;

float noiseST0_noise = noise(noiseST0_freq* s0_s, noiseST0_freq* noiseST0_t);
// END NODE noiseST0 

Ci = noiseST0_noise; Oi = 1.0;}
