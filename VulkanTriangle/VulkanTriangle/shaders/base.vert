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

layout (location = 0) out vec3 outNormal;

void main()
{
	outNormal = inNormal;
	gl_Position = vec4(inPos.xyz, 1.0);
}