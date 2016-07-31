surface voronoi2d0_surface()
{
// START NODE s0 

float s0_s = s;
// END NODE s0 

// START NODE t0 

float t0_t = t;
// END NODE t0 

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

Ci = voronoi2d0_f1; Oi = 1.0;}
