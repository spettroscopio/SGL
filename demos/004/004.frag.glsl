#version 330 core

uniform sampler2D u_texture; // the active texture unit 

in vec2 v_texCoord; 

out vec4 fragColor; 

void main () {
  fragColor = texture (u_texture, v_texCoord);
}
