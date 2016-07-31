#include "project.h"
surface texture0_surface()
{
// START NODE texture0 
string texture0_fileName = "/home/libe/workspace/ShaderLink/src/data/shader/texture.tex";
string texture0_projType = "spherical";
string texture0_projSpace = "shader";
matrix texture0_offsetMatrix = matrix(1.000,0.000,0.000,0.000,0.000,1.000,0.000,0.000,0.000,0.000,1.000,0.000,0.000,0.000,0.000,1.000);
float texture0_blur = 0.000;



	float texture0_outAlpha;
	color texture0_outColor = GetColorTextureAndAlpha(texture0_fileName, 
												  texture0_projType, 
												  P,
												  texture0_projSpace, 
												  texture0_offsetMatrix, 
												  texture0_blur,
												  3,
												  texture0_outAlpha);

// END NODE texture0 

Ci = texture0_outColor;Oi = texture0_outAlpha;}
