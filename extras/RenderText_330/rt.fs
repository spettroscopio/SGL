#version 330 core

// the text color
uniform vec4 u_color;

// the active texture unit
uniform sampler2D u_texture;

// the varying texture coordinates
in vec2 v_texCoord;

// the output of the fragment shader
out vec4 fragColor;

void main () {
  fragColor = texture (u_texture, v_texCoord) * u_color;
}
