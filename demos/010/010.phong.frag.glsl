#version 330 core

in vec3 v_fragPos;
in vec2 v_texCoord;
in mat3 TBN; 

// this is used only when normal mapping is disabled
in vec3 v_normal;

struct material {
 sampler2D diffuseMap;
 sampler2D specularMap;
 sampler2D normalMap; 
 sampler2D emissiveMap; 
 float shiness;
};

struct light {
  vec3 vPos;
  vec3 vDiffuseColor;
  vec3 vAmbientColor;
  vec3 vSpecularColor;  
  vec3 vEmissiveColor;
};

uniform mat4 u_model;

uniform material u_material;
uniform light u_light;
uniform vec3 u_eye;
uniform int u_NormalMapping;

out vec4 fragColor; 

void main () {
    vec3 normal;
    
    if (u_NormalMapping != 0) {
        // this samples the normals from the map per fragment
        normal = texture (u_material.normalMap, v_texCoord).xyz;  
        normal = normal * 2.0 - 1.0;
        normal = normalize (TBN * normal);
    } else {
        // this uses the single normal per vertex
        normal = normalize ( (u_model * vec4(v_normal, 0.0)).xyz );
    }
       
    // from fragment to eye pos
    vec3 lightDir = normalize (u_light.vPos - v_fragPos); 
    
    // from eye to fragment
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
    vec3 emissive = u_light.vEmissiveColor * vec3(texture (u_material.emissiveMap, v_texCoord));
    
    fragColor = vec4(ambient + diffuse + specular + emissive, 1.0);
}

