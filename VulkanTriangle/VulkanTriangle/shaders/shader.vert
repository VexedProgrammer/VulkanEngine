#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
	int layer;
} ubo;

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inNormal;
layout(location = 2) in vec2 inTexCoord;


layout(location = 0) out vec3 fragNormal;
layout(location = 1) out vec2 fragTexCoord;
layout(location = 3) out int fragLayer;

vec3 lDir = vec3(0, -1, -1);
layout(location = 2) out vec3 lightDir;

void main() {

	lightDir = mat3(ubo.view)*normalize(-lDir);
	fragNormal = mat3(transpose(inverse(ubo.model))) * inNormal;
	fragLayer = ubo.layer;
	vec3 newPos = inPosition + (normalize(inNormal)*ubo.layer*0.0015);//inPosition * (1+ubo.layer*0.15);// + (normalize(fragNormal) * (ubo.layer*0.1));
    gl_Position = ubo.proj * ubo.view * ubo.model * vec4(newPos, 1.0);
	
	fragTexCoord = inTexCoord;
}