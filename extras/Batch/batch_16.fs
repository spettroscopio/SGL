#version 330 core

in vec2  v_texCoord;
in vec4  v_color;
flat in float v_texUnit;

uniform sampler2D u_texUnits [16]; // max 16 texture units supported 

out vec4 fragColor;

vec4 SampleFromUnit (float texUnit, vec2 texCoord)
{    
 vec4 c;
 int index = int(texUnit);

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
    } 
       
    return c;
}

void main () {    
 fragColor = SampleFromUnit (v_texUnit, v_texCoord) * v_color; 
}
