#version 330 core

// attributes of the vertex
layout (location = 0) in vec4 position;
layout (location = 1) in vec2 texCoord;

// output sent to the fragment shader
out vec2 v_texCoord; 

void main () {
 gl_Position = position;
 v_texCoord = texCoord;
}
