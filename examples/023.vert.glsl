#version 330 core

layout (location = 0) in vec4 vertex_position;
layout (location = 1) in vec4 vertex_color;

out vec4 interpolated_vertex_color;

uniform mat4 u_matrix;

void main () {
	interpolated_vertex_color = vertex_color;
	gl_Position = u_matrix * vertex_position;
}
