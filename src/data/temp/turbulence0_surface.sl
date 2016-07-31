#include "filterwidth.h"
#include "filtered.h"
#include "noises.h"
surface turbulence0_surface()
{
// START NODE P0 

point P0_outPoint = P;
// END NODE P0 

// START NODE turbulence0 
float turbulence0_freq = 10.000;
float turbulence0_flatness = 0.100;

float turbulence0_outValue;
point turbulence0_PP;
float turbulence0_width, turbulence0_cutoff, turbulence0_fade, turbulence0_f, turbulence0_turb, turbulence0_maxfreq = 16;
	
/* compute turbulence */

turbulence0_PP = P0_outPoint * turbulence0_freq;

turbulence0_width = filterwidthp(turbulence0_PP);
turbulence0_cutoff = clamp(0.5 / turbulence0_width, 0, turbulence0_maxfreq);

turbulence0_turb = 0;
for (turbulence0_f = 1; turbulence0_f < 0.5 * turbulence0_cutoff; turbulence0_f *= 2) 
    turbulence0_turb += abs(snoise(turbulence0_PP * turbulence0_f)) / turbulence0_f;
turbulence0_fade = clamp(2 * (turbulence0_cutoff - turbulence0_f) / turbulence0_cutoff, 0, 1);
turbulence0_turb += turbulence0_fade * abs(snoise(turbulence0_PP * turbulence0_f)) / turbulence0_f;

/* raise to power to create flat areas */

turbulence0_outValue = pow(turbulence0_turb, turbulence0_flatness);

// END NODE turbulence0 

Ci = turbulence0_outValue; Oi = 1.0;}
