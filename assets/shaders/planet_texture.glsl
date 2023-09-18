uniform vec2 resolution;
uniform float seed;
uniform vec2 pos;
out vec4 fragColor;

void main()
{
    vec2 uv =(pos+gl_FragCoord.xy)/resolution.xy;

    vec3 col = 0.5 + 0.5*cos(seed+uv.xyx+vec3(0,2,4));

    fragColor = vec4(col,1.0);
}