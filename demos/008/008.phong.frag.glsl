#version 330 core

in vec3 v_color;
in vec3 v_normal;
in vec3 v_fragPos;

struct light {
  vec3 vPos;
  vec3 vDiffuseColor;
  vec3 vAmbientColor;
  vec3 vSpecularColor;
  float shiness;
};

uniform light u_light;
uniform vec3 u_eye;

out vec4 fragColor; 

void main () {                
    vec3 normal = normalize (v_normal);
        
    // from light to fragment
    vec3 lightDir = normalize (v_fragPos - u_light.vPos); 
    
    // from eye to fragment
    vec3 viewDir = normalize (v_fragPos - u_eye); 
    
    // light reflected from the surface 
    vec3 reflectDir = reflect (-lightDir, normal); 
    
    // based on the angle bewtween light and surface
    float diffuseFactor = max (dot (normal, -lightDir), 0.0); 
    
    // based on the angle bewtween the reflected light and the viewing direction
    float specularFactor = pow (max(dot(-viewDir, reflectDir), 0.0), u_light.shiness); 
    
    vec3 ambient  = u_light.vAmbientColor;
    vec3 diffuse  = u_light.vDiffuseColor * diffuseFactor;
    vec3 specular = u_light.vSpecularColor * specularFactor;
    
    fragColor = vec4(v_color * (ambient + diffuse + specular), 1.0);
}

