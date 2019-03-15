#version 450

layout (triangles) in;
layout (line_strip, max_vertices = 6) out;

layout (set = 0, binding = 2) uniform GeomUniformBufferObject 
{
	mat4 projection;
	mat4 model;
	mat4 view;
	vec2 screenSize;
} ubo;

layout (location = 1) in vec3 inNormal[];

layout (location = 0) out vec3 outColor;

void main(void)
{	
	float normalLength = 0.01;
	for(int i=0; i<gl_in.length(); i++)
	{
		vec4 pos = vec4(gl_in[i].gl_Position.xyz, 1.0);
		mat3 normalMat = mat3(transpose(inverse(ubo.view*ubo.model)));
		vec3 normal = normalize(vec3(ubo.projection * vec4(normalMat * inNormal[i].xyz, 0.0)));

		//gl_Position = ubo.projection * (ubo.model * vec4(pos, 1.0));
		//outColor = vec3(1.0, 0.0, 0.0);
		//EmitVertex();

		//gl_Position = ubo.projection * (ubo.model * vec4(pos + normal * normalLength, 1.0));
		//outColor = vec3(0.0, 0.0, 1.0);
		//EmitVertex();

		//EndPrimitive();
		
		gl_Position = vec4(pos.xyz, 1.0);
		outColor = vec3(1.0, 0.0, 0.0);
		EmitVertex();
		gl_Position = vec4(pos.xyz + normal * normalLength, 1.0);
		outColor = vec3(1.0, 0.0, 0.0);
		EmitVertex();
		EndPrimitive();
	}

    EndPrimitive();
}