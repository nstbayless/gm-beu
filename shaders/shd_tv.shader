//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_texcoord;
varying vec4 v_color;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_color = in_Colour;
    v_texcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_texcoord;
varying vec4 v_color;
uniform float time;
uniform float bw;

void main()
{
vec2 uv = v_texcoord.xy;
vec3 col;

col.r = texture2D(gm_BaseTexture, vec2(uv.x, uv.y)).r;
col.g = texture2D(gm_BaseTexture, vec2(uv.x, uv.y)).g;
col.b = texture2D(gm_BaseTexture, vec2(uv.x, uv.y)).b;

// Scanlines
col *= 0.985 + 0.015 * sin(time * time * 53.0 + (uv.y * 168.0 + uv.x * 90.0) * (1.0 + 0.4*sin(time*0.2)));

// Similar results to rand() function, but more efficient.
col *= 1.0 - 0.03 * fract(tan(time * 100.0));

// convert to b/w

float bwcol;

bwcol = clamp(0.7*col.r+0.8*col.g+0.6*col.b,0.0,1.0);
col=col*bw+bwcol*(1.0-bw);
gl_FragColor = vec4(col, 1.0);
}
