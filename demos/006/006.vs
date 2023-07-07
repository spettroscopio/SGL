#version 330 core

// attributes of the vertex
layout (location = 0) in vec4  position;
layout (location = 1) in vec2  texCoord;
layout (location = 2) in float texUnit;

// output sent to the fragment shader
out vec2  v_texCoord; // interpolated texture coordinates
flat out float v_texUnit; // the texture unit for this quad of the cube

uniform mat4 u_model;
uniform mat4 u_view;
uniform mat4 u_projection;

void main () {
 gl_Position = u_projection * u_view * u_model * position;
 v_texCoord = texCoord;
 v_texUnit = texUnit;
}
