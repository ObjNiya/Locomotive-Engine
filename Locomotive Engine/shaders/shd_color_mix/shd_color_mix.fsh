//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform bool u_bMixInverse;
uniform int u_iMixMode;
uniform vec4 u_vMixColor;

void main()
{
    vec4 vFragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    float fColorSum = (vFragColor.r + vFragColor.g + vFragColor.b) / 3.;
    
    if (u_bMixInverse)
        fColorSum = 1. - fColorSum;
    
    if (u_iMixMode == 0)
        vFragColor *= u_vMixColor;
    else if (u_iMixMode == 1)
        vFragColor.rgb = mix(vec3(0.), u_vMixColor.rgb, fColorSum * u_vMixColor.a);
    else if (u_iMixMode == 2)
        vFragColor.rgb = mix(vFragColor.rgb, u_vMixColor.rgb, fColorSum * u_vMixColor.a);
    else
        vFragColor.rgb = mix(vFragColor.rgb, u_vMixColor.rgb, u_vMixColor.a);

    gl_FragColor = vFragColor;
}
