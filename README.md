# CLE Shadertoy

This project uses [GeeXLab](http://www.geeks3d.com/geexlab/downloads/). 
GeeXLab is available for Windows, MacOS, Linux, and Raspberry Pi.
Please download it and make the following changes to run this project.

First you need to create a `start_shadertoy.bat` script (or equivalent for other OS) and set the path to the `GeeXLab.exe` executable.
For example, it could be the following:

```
start C:\GeeXLab_FREE_win64\GeeXLab.exe /log_framerate /no_menubar /glinfo /demofile="tiled_display.xml"
```

The commands to load an image are in `tiled_display.xml`.
The majority of the code inside block in the xml file is lua. Comments in lua begin with `--`.


## Notes

* Image loading uses [gh_texture.create_from_file()](http://www.geeks3d.com/geexlab/reference/scripting_texture.php#create_from_file) or its relatives (v2, etc.)
* * Call `create_from_file` inside `init_scene` 
* * Call `gh_texture.bind(tex, 0)` inside `update_scene` with `gh_gpu_program.uniform1i(gpu_prog_01, "iChannel0", 0)` to bind it
* Video loading/updating uses [gh_av.video_init_texture()](http://www.geeks3d.com/geexlab/reference/scripting_av.php#video_init_texture)
* * Call `video_init_texture` inside `init_scene`
* * As above, bind the texture inside `update_scene` but also call `gh_av.video_update_texture(av, tex_id)` to get a new frame

I had to change `fragCoord` to `gl_FragCoord` to get the code to work in GeeXLab.

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