#version 450

layout (location = 0) in vec3 inColor;
layout (location = 1) in vec2 inTexCoords;
layout(binding = 1) uniform sampler2D texSampler;

layout (location = 0) out vec4 outFragColor;

void main(void)
{
	vec4 col = texture(texSampler, inTexCoords);
	//if(col.r+col.g+col.b > 0.8)
	//{
	//	discard;
	//}
	outFragColor = vec4(vec3(0.15,0.05,0.005), col.a-inTexCoords.y);
}