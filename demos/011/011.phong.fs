#version 330 core

in vec3 v_fragPos;
in vec2 v_texCoord;
in mat3 TBN; 
in float vDrawDecal;

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

struct decalType {
 sampler2D decal;
 float type;
};

uniform mat4 u_model;

uniform decalType u_decal;
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

    vec4 decalColor = vec4(0.0, 0.0, 0.0, 0.0); // vec4 because the decal alpha channel is relevant
    
    if (vDrawDecal == 1.0) { // is a decal specified for this face in the vertex attributes ?            
        
        // u_decal.type == 0 means do not draw the decal
        
        if (u_decal.type == 2) { // painted on the box
            // 0.3 it's used to send some paint between the 'fake 3D' parallel metal rows
            vec3 decalModulate = clamp(texture (u_material.specularMap, v_texCoord).rgb + 0.3, vec3(0,0,0), vec3(1,1,1));
            decalColor = texture (u_decal.decal, v_texCoord) * vec4(decalModulate, 1.0);
        } else if (u_decal.type == 1) { // plastic sticker
            decalColor = texture (u_decal.decal, v_texCoord);            
        }   
    };
    
    // the original diffuse map sampled together with the decal
    vec3 diffuseDecal = vec3(texture (u_material.diffuseMap, v_texCoord)) * (1.0 - decalColor.a) + (decalColor.rgb * decalColor.a);
          
    vec3 ambient  = u_light.vAmbientColor * diffuseDecal;
    vec3 diffuse  = u_light.vDiffuseColor * diffuseFactor * diffuseDecal;
    vec3 specular = u_light.vSpecularColor * specularFactor * vec3(texture (u_material.specularMap, v_texCoord)); 
    vec3 emissive = u_light.vEmissiveColor * vec3(texture (u_material.emissiveMap, v_texCoord));
                    
    fragColor = vec4(ambient + diffuse + specular + emissive, 1.0);        
}

