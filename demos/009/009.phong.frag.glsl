#version 330 core

in vec3 v_fragPos;
in vec2 v_texCoord;
in vec3 v_normal;

struct material {
 sampler2D diffuseMap;
 sampler2D specularMap;
 float shiness;
};

struct light {
  vec3 vPos;
  vec3 vDiffuseColor;
  vec3 vAmbientColor;
  vec3 vSpecularColor;  
};

uniform mat4 u_model;

uniform material u_material;
uniform light u_light;
uniform vec3 u_eye;

out vec4 fragColor; 

void main () {                
    vec3 normal = normalize (v_normal);    
    
    // from fragment to light pos
    vec3 lightDir = normalize (u_light.vPos - v_fragPos); 
    
    // from fragment to eye pos
    vec3 viewDir = normalize (u_eye - v_fragPos); 
    
    // light reflected from the surface 
    vec3 reflectDir = reflect (lightDir, normal); 
    
    // based on the angle bewtween light and surface
    float diffuseFactor = max (dot (normal, lightDir), 0.0); 
    
    // based on the angle bewtween the reflected light and the viewing direction
    float specularFactor = pow (max(dot(viewDir, reflectDir), 0.0), u_material.shiness); 
    
    vec3 ambient  = u_light.vAmbientColor * vec3(texture (u_material.diffuseMap, v_texCoord));
    vec3 diffuse  = u_light.vDiffuseColor * diffuseFactor * vec3(texture (u_material.diffuseMap, v_texCoord)); 
    vec3 specular = u_light.vSpecularColor * specularFactor * vec3(texture (u_material.specularMap, v_texCoord)); 
    
    fragColor = vec4(ambient + diffuse + specular, 1.0);
}

