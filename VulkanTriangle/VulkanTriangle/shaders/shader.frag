#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(location = 0) in vec3 fragNormal;
layout(location = 1) in vec2 fragTexCoord;
layout(location = 3) flat in int fragLayer;

layout(binding = 1) uniform sampler2D texSampler;

layout(location = 0) out vec4 outColor;


vec3 ambLight = vec3(0.35, 0.35, 0.35);
layout(location = 2) in vec3 lightDir;
vec3 lightColour = vec3(1, 1, 1);

void main() {
	
	vec3 norm = normalize(fragNormal);
	float diff =  max(dot(norm, lightDir), 0.0);
	vec3 diffuse = lightColour * diff;
	vec4 col = texture(texSampler, fragTexCoord);
	float alpha = 1.0/fragLayer;
	if(col.r+col.g+col.b < 0.5)
	{
		discard;
	}
	
	outColor = vec4((ambLight+ diffuse)*col.xyz, alpha);
	
	

    //outColor = texture(texSampler, fragTexCoord);
	//outColor = vec4(fragTexCoord, 0.0, 1.0);
}