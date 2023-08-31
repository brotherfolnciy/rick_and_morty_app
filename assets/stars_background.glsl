#define M_PI 3.1415926535897932384626433832795

uniform float time;
uniform vec2 resolution;
out vec4 fragColor;

float rand(vec2 co)
{
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void main(void)
{
	float size = 30;
	float prob = 0.99;
	
	vec2 pos = floor(1.0 / size * gl_FragCoord.xy);
	
	float color = 0.0;
	float starValue = rand(pos);
	
	
	if (rand(gl_FragCoord.xy / resolution.xy) > 0.996)
	{
		float r = rand(gl_FragCoord.xy);
		color = r * (0.25 * sin(time * (r * 5.0) + 720.0 * r) + 1);
	}
	
	fragColor = vec4(vec3(color), 1.0);
}
