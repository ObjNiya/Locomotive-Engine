//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

/// @inspector slider min=0.0 max=1.0 step=0.01
uniform float u_fdissolveAmt;
uniform float u_fTime;

float random (vec2 st) {
    return fract(sin(dot(st.xy * u_fTime,
                         vec2(12.9898,78.233)))*
        43758.5453123);
}

void main()
{
    float fRnd = random(v_vTexcoord);
    vec4 vFragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    vFragColor *= float(fRnd >= u_fdissolveAmt);
    
    gl_FragColor = vFragColor;
}
