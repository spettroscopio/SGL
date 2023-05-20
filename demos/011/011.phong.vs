#version 330 core

// attributes of the vertex

layout (location = 0) in vec4 position;
layout (location = 1) in vec2 texCoord;
layout (location = 2) in vec3 normal;
layout (location = 3) in vec3 tangent;
layout (location = 4) in vec3 bitangent;
layout (location = 5) in float drawDecal;

// output sent to the fragment shader

out vec3  v_fragPos; // fragment position in world coordinates
out vec2  v_texCoord; // texture coordinates
out mat3  TBN ; // tangent-bitangent-normal matrix
out vec3  v_normal; // normal vector used when normal mapping is OFF
out float vDrawDecal;

uniform mat4 u_model;
uniform mat4 u_view;
uniform mat4 u_projection;

void main () {
 gl_Position = u_projection * u_view * u_model * position;
 v_fragPos = (u_model * position).xyz; 
  
 v_normal = normal;

 v_texCoord = texCoord;
 
 vDrawDecal = drawDecal;
 
 vec3 T = normalize(vec3(u_model * vec4(tangent,   0.0)));
 vec3 B = normalize(vec3(u_model * vec4(bitangent, 0.0)));
 vec3 N = normalize(vec3(u_model * vec4(normal,    0.0)));
 
 TBN = mat3(T, B, N); 
}
