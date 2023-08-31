precision highp float;

uniform float time;
uniform vec2 resolution;
out vec4 fragColor;

float vDrop(vec2 uv,float t)
{
    uv.x = uv.x*128.0;						// H-Count
    float dx = fract(uv.x);
    uv.x = floor(uv.x);
    uv.y *= 0.05;							// stretch
    float o=sin(uv.x*215.4);				// offset
    float s=cos(uv.x*33.1)*.3 +.7;			// speed
    float trail = mix(95.0,35.0,s);			// trail length
    float yv = fract(uv.y + t*s + o) * trail;
    yv = 1.0/yv;
    yv = smoothstep(0.0,1.0,yv*yv);
    yv = sin(yv*3.14)*(s*5.0);
    float d2 = sin(dx*3.14);
    return yv*(d2*d2);
}

void main(void)
{
    vec2 p = (gl_FragCoord.xy - 0.001 * resolution.xy) / resolution.y;
    float d = length(p)+0.2;
	p = vec2(atan(p.x, p.y) / 3.14, 3 / d);
    float t =  time*0.4;
    vec3 col = vec3(1,1,1) * vDrop(p,t);	
    col += vec3(.3,.3,.3) * vDrop(p,t+0.33);	
	fragColor = vec4(col*(d*d), .001);
}