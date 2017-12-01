Converting the shadertoy from https://www.shadertoy.com/view/Md2fWd into Falcor.

Code below:
```
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.xy;
    
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

}

```