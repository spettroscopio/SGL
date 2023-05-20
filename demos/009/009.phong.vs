#version 330 core

// attributes of the vertex

layout (location = 0) in vec4 position;
layout (location = 1) in vec2 texCoord;
layout (location = 2) in vec3 normal;

// output sent to the fragment shader

out vec3  v_fragPos; // fragment position in world coordinates
out vec2  v_texCoord; // texture coordinates
out vec3  v_normal; // normal vector

uniform mat4 u_model;
uniform mat4 u_view;
uniform mat4 u_projection;

void main () {
 gl_Position = u_projection * u_view * u_model * position;
 v_fragPos = (u_model * position).xyz; 
 v_normal = (u_model * vec4(normal, 0.0)).xyz;  
 v_texCoord = texCoord;
}
