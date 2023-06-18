#version 330 core

in vec4 v_vertex_color;

out vec4 fragColor;

void main () {
	fragColor = v_vertex_color;
}
