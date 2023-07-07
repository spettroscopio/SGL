#version 330 core

// attributes of the vertex
layout (location = 0) in vec4 pos;
layout (location = 1) in vec3 texCoord;
layout (location = 2) in vec4 color;
layout (location = 3) in float texUnit;

out vec3  v_texCoord;
out vec4  v_color;
flat out float v_texUnit; 

// ortho projection
uniform mat4 u_projection;

 void main () {
  gl_Position = u_projection * pos;
  v_texCoord = texCoord;
  v_color = color;
  v_texUnit = texUnit;
 }
