//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

float random (vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))*
        43758.5453123);
}

uniform float u_fTime;
uniform vec4 u_vUVs;
uniform vec3 u_vColToStatic;
uniform vec3 u_vStaticBackCol;
uniform vec3 u_vStaticCol;

void main()
{
    vec4 vFragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    if (u_vColToStatic.r != vFragColor.r || u_vColToStatic.g != vFragColor.g || u_vColToStatic.b != vFragColor.b)
    {
        gl_FragColor = vFragColor;
        return;
    }
    
    vec2 vTexcoord;
    vTexcoord.x = (v_vTexcoord.x - u_vUVs.r) / u_vUVs.b;
    vTexcoord.y = (v_vTexcoord.y - u_vUVs.g) / u_vUVs.a;
    
    float fRnd = random(vTexcoord * u_fTime);
    
    if (fRnd >= 0.5)
        gl_FragColor = vec4(u_vStaticCol, vFragColor.a);
    else
        gl_FragColor = vec4(u_vStaticBackCol, vFragColor.a);
}
