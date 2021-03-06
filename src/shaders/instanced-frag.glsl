#version 300 es
precision highp float;

in vec4 fs_Col;
in vec4 fs_Pos;
in vec4 fs_Nor;
out vec4 out_Col;

void main()
{
    
    vec4 lightVec = vec4(10.0, -15.0, 0.0, 1.0);
    float diffuseTerm = dot(normalize(fs_Nor), normalize(lightVec));
    diffuseTerm = clamp(diffuseTerm, 0.0, 1.0);
    float ambientTerm = 0.6;
    float lightIntensity = diffuseTerm + ambientTerm;
    vec4 diffuseColor = fs_Col;
    //out_Col = vec4(1.0, 1.0, 1.0, 1.0);
    
    out_Col = fs_Col;

    out_Col = vec4(diffuseColor.rgb * lightIntensity, 1.0);

    float t = dot(normalize(fs_Nor), normalize(vec4(lightVec)));

    vec3 a = vec3(0.5f, 0.5f, 0.5f);
    vec3 b = vec3(0.5f, 0.5f, 0.5f);
    vec3 c = vec3(1.0f, 1.0f, 1.0f);
    vec3 d = vec3(0.0f, 0.33f, 0.67f);
    out_Col = vec4((a + b * cos(2.0 * 3.14f * (c * t + d))) * lightIntensity, 1.0);

}
