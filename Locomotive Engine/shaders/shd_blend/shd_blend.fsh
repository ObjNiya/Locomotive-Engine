//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 u_vBlend;

void main()
{
    vec4 vBaseColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    vBaseColor.rgb = mix(vBaseColor.rgb, u_vBlend.rgb, u_vBlend.a);
    
    gl_FragColor = vBaseColor;
}
