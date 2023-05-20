#version 330 core

uniform sampler2D u_Texture1; 
uniform sampler2D u_Texture2; 
uniform float u_Mixing; 

in vec2 v_texCoord; // the varying texture coordinates

out vec4 fragColor; // the output of the fragment shader 

void main () {
  vec4 sample1;
  vec4 sample2;
  
  sample1 = texture (u_Texture1, v_texCoord); 
  sample2 = texture (u_Texture2, v_texCoord); 
 
  fragColor = mix(sample1, sample2, u_Mixing);
}