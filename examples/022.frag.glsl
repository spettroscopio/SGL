#version 330 core

uniform sampler2D u_Texture; // the active texture unit 

in vec2 v_texCoord; // the varying texture coordinates

out vec4 fragColor; // the output of the fragment shader 

void main () {
  fragColor = texture (u_Texture, v_texCoord); // lookup inside the texture using the varying
}