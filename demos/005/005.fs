#version 330 core

in vec2  v_texCoord; 

// flat is required on some nVidia drivers, else fragments of the wrong textures are sampled

flat in float v_texUnit;

out vec4 fragColor; 

uniform sampler2D u_texUnits[6]; 

void main () {
 int index = int(v_texUnit);
  
 switch (index) {
    case 0:
        fragColor = texture (u_texUnits[0], v_texCoord);
        break;
    case 1:
        fragColor = texture (u_texUnits[1], v_texCoord);
        break;
    case 2:
        fragColor = texture (u_texUnits[2], v_texCoord);
        break;
    case 3:
        fragColor = texture (u_texUnits[3], v_texCoord);
        break;
    case 4:
        fragColor = texture (u_texUnits[4], v_texCoord);
        break;
    case 5:
        fragColor = texture (u_texUnits[5], v_texCoord);
        break; 
 }
 
}

