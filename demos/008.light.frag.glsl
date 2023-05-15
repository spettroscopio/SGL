#version 330 core

uniform vec3 u_lampColor;

out vec4 fragColor; 

void main () {
    fragColor = vec4(u_lampColor, 1.0);
}

