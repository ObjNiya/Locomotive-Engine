//
// Simple passthrough fragment shader
//
varying vec3 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D u_DitherTex;
uniform vec2 u_DitherSize;

void main()
{
    vec2 dither_pos = (mod(v_vPosition.xy, u_DitherSize) / u_DitherSize);
    vec4 dither_color = texture2D(u_DitherTex, dither_pos);
    vec4 base_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    float alpha = float(base_color.a > (dither_color.r + dither_color.g + dither_color.b) / 3.0);
    
    gl_FragColor = vec4(base_color.rgb, alpha);
}

