#version 450

layout(binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
	int layer;
} ubo;

layout (location = 0) in vec3 inPos;
layout (location = 1) in vec3 inNormal;
layout (location = 2) in vec2 inTexCoords;

layout (location = 1) out vec3 outNormal;
layout (location = 2) out vec4 spos;
layout (location = 3) out vec4 pos;

void main()
{
	vec3 newPos = inPos;// + (normalize(inNormal)*0.);
	gl_Position = ubo.proj * (ubo.view * ubo.model)*vec4(newPos + inNormal * 0.00, 1.0);
	spos = ubo.proj * (ubo.view * ubo.model)*vec4(newPos + inNormal * 0.00, 1.0);
	pos = ubo.proj * (ubo.view * ubo.model)*vec4(newPos + inNormal * 0.009, 1.0);
	outNormal = inNormal;
}