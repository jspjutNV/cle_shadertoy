#version 460

uniform vec3      iResolution;     // viewport resolution (in pixels)
uniform float     iTime;     // shader playback time (in seconds)
uniform vec4      iMouse;          // mouse pixel coords. xy: current (if MLB down), zw: click
uniform sampler2D iChannel0;

in vec2 fragCoord;
out vec4 fragColor;

void main()
{
	vec2 uv = gl_FragCoord.xy / iResolution.xy;
    
	fragColor = vec4(uv,0.5+0.5*sin(iTime),1.0);
	
//    int frame_number = int(floor(iTime / 16.66667));
    
//    frame_number % 4;
    
//    float c = float(iFrame%4)/4.0;
//    uv /= 2.0;
    
//    float b = texture(iChannel0, vec2(uv.x/3.0, uv.y)).r;
//    float r = texture(iChannel0, vec2(1.0/3.0 + uv.x/3.0, uv.y)).r;
//    float g = texture(iChannel0, vec2(2.0/3.0 + uv.x/3.0, uv.y)).r;

//    float r = texture(iChannel0, vec2(uv.x/3.0, uv.y)).r;
//    float g = texture(iChannel0, vec2(1.0/3.0 + uv.x/3.0, uv.y)).r;
//    float b = texture(iChannel0, vec2(2.0/3.0 + uv.x/3.0, uv.y)).r;

//    float g = texture(iChannel0, vec2(uv.x/3.0, uv.y)).r;
//    float r = texture(iChannel0, vec2(1.0/3.0 + uv.x/3.0, uv.y)).r;
//    float b = texture(iChannel0, vec2(2.0/3.0 + uv.x/3.0, uv.y)).r;

    
    float g = texture(iChannel0, vec2(uv.x/3.0, uv.y)).r;
    float b = texture(iChannel0, vec2(1.0/3.0 + uv.x/3.0, uv.y)).r;
    float r = texture(iChannel0, vec2(2.0/3.0 + uv.x/3.0, uv.y)).r;

    
//    float r = texture(iChannel0, vec2(uv.x, uv.y)).g;
  //  float g = texture(iChannel1, vec2(uv.x, uv.y)).g;
    //float b = texture(iChannel2, vec2(uv.x, uv.y)).g;
//    float g = texture(iChannel0, vec2(1.0/3.0 + uv.x/3.0, uv.y)).r;
//    float b = texture(iChannel0, vec2(2.0/3.0 + uv.x/3.0, uv.y)).r;

    
    fragColor = vec4(r, g, b, 1.0);
//    fragColor = vec4(r);
//    fragColor = vec4(g);
//    fragColor = vec4(b);

    // test direct texture map
    // fragColor = vec4(uv, 0.0, 1.0);

}
