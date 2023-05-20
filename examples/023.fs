#version 330 core

in vec4 interpolated_vertex_color;
out vec4 fragColor;

void main () {
	fragColor = interpolated_vertex_color;
}
