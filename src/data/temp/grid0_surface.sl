surface grid0_surface()
{
// START NODE grid0 
float grid0_freq = 20.000;
float grid0_rotation = 45.000;
float grid0_fuzz = 4.000;
float grid0_linewidth = 0.350;
color grid0_SurfaceColor = color(1.000,1.000,1.000);
color grid0_GridColor = color(0.000,0.000,0.000);

#define repeat(x,freq)    (mod((x) * (freq), 1.0))
#define pulse(a,b,fuzz,x) (smoothstep((a)-(fuzz),(a),(x)) - smoothstep((b)-(fuzz),(b),(x)))
#define rotate2d(x,y,rad,ox,oy,rx,ry) rx = ((x) - (ox)) * cos(rad) - ((y) - (oy)) * sin(rad) + (ox); ry = ((x) - (ox)) * sin(rad) + ((y) - (oy)) * cos(rad) + (oy)
#define blend(a,b,x) ((a) * (1 - (x)) + (b) * (x))

  float grid0_ss, grid0_tt;
  
  rotate2d(s, t, radians(grid0_rotation), 0.5, 0.5, grid0_ss, grid0_tt);
  grid0_ss= repeat(grid0_ss, grid0_freq);
  grid0_tt= repeat(grid0_tt, grid0_freq);

  color grid0_layer_opac= pulse(grid0_linewidth, 1-grid0_linewidth, grid0_fuzz, grid0_tt);
  color grid0_outColor = blend(grid0_SurfaceColor, grid0_GridColor, grid0_layer_opac);
// END NODE grid0 

Ci = grid0_outColor; Oi = 1.0;}
