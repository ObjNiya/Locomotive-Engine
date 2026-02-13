//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_fLifespanStart;
uniform float u_fLifespan;

#define WHITE_THRESHOLD 0.5

void main()
{
    vec4 vFragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    float fColorSum = (vFragColor.r + vFragColor.g + vFragColor.b) / 3.;
    
    vFragColor.rgb = mix(vec3(.972), vFragColor.rgb, float(fColorSum >= WHITE_THRESHOLD));
    
    gl_FragColor = vFragColor;
}