#version 330 core

in vec3  v_texCoord;
in vec4  v_color;
flat in float v_texUnit;

out vec4 fragColor;

uniform sampler2DArray u_texUnits [32]; // max 32 texture units supported 

vec4 SampleFromUnit (float texUnit, vec3 texCoord)
{    
 vec4 c;
 int index = int(texUnit);
 
 // the x, y of v_texCoord are the usual texture coordinates
 // the z of v_texCoord select the subtexture inside the 2D Array Texture
 
 switch (index) {
    case 0:
        c = texture (u_texUnits[0], texCoord);
        break;
    case 1:
        c = texture (u_texUnits[1], texCoord);
        break;
    case 2:
        c = texture (u_texUnits[2], texCoord);
        break;
    case 3:
        c = texture (u_texUnits[3], texCoord);
        break;
    case 4:
        c = texture (u_texUnits[4], texCoord);
        break;
    case 5:
        c = texture (u_texUnits[5], texCoord);
        break;
    case 6:
        c = texture (u_texUnits[6], texCoord);
        break;
    case 7:
        c = texture (u_texUnits[7], texCoord);
        break;
    case 8:
        c = texture (u_texUnits[8], texCoord);
        break;
    case 9:
        c = texture (u_texUnits[9], texCoord);
        break;
    case 10:
        c = texture (u_texUnits[10], texCoord);
        break;
    case 11:
        c = texture (u_texUnits[11], texCoord);
        break;
    case 12:
        c = texture (u_texUnits[12], texCoord);
        break;
    case 13:
        c = texture (u_texUnits[13], texCoord);
        break;
    case 14:
        c = texture (u_texUnits[14], texCoord);
        break;
    case 15:
        c = texture (u_texUnits[15], texCoord);
        break;
    case 16:
        c = texture (u_texUnits[16], texCoord);
        break;
    case 17:
        c = texture (u_texUnits[17], texCoord);
        break;        
    case 18:
        c = texture (u_texUnits[18], texCoord);
        break;        
    case 19:
        c = texture (u_texUnits[19], texCoord);
        break;        
    case 20:
        c = texture (u_texUnits[20], texCoord);
        break;        
    case 21:
        c = texture (u_texUnits[21], texCoord);
        break;        
    case 22:
        c = texture (u_texUnits[22], texCoord);
        break;        
    case 23:
        c = texture (u_texUnits[23], texCoord);
        break;        
    case 24:
        c = texture (u_texUnits[24], texCoord);
        break;        
    case 25:
        c = texture (u_texUnits[25], texCoord);
        break;        
    case 26:
        c = texture (u_texUnits[26], texCoord);
        break;        
    case 27:
        c = texture (u_texUnits[27], texCoord);
        break;        
    case 28:
        c = texture (u_texUnits[28], texCoord);
        break;        
    case 29:
        c = texture (u_texUnits[29], texCoord);
        break;        
    case 30:
        c = texture (u_texUnits[30], texCoord);
        break;        
    case 31:
        c = texture (u_texUnits[31], texCoord);
        break;        
 } 
       
 return c;
}

void main () {    
 fragColor = SampleFromUnit (v_texUnit, v_texCoord) * v_color; 
}

