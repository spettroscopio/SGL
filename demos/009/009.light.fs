#version 330 core

struct lamp {
 vec3 color;
 sampler2D texture;
};

uniform lamp u_lamp;

in vec2  v_texCoord;

out vec4 fragColor; 

void main () {    
    fragColor = vec4(u_lamp.color, 1.0) * texture (u_lamp.texture, v_texCoord);
}

