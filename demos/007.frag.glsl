#version 330 core

in vec3  v_texCoord; 

out vec4 fragColor; 

uniform sampler2DArray u_texture; 

void main () {
    // the x, y of v_texCoord are the usual texture coordinates
    // the z of v_texCoord select the subtexture inside the 2D Array Texture
    fragColor = texture (u_texture, v_texCoord);
}

