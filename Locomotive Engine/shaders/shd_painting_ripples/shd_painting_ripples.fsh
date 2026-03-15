//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 u_vUVs;
uniform float u_fTime;

#define RIPPLE_SIZE 50.
#define RIPPLE_STRENGTH 0.003

void main()
{
    vec2 vTexcoord = v_vTexcoord;
    vTexcoord.x = (vTexcoord.x - u_vUVs.r) / (u_vUVs.b - u_vUVs.r);
	vTexcoord.y = (vTexcoord.y - u_vUVs.g) / (u_vUVs.a - u_vUVs.g);
    
    float fCenterDist = length(vTexcoord - vec2(.5)) * RIPPLE_SIZE;
    vec2 vRipple = normalize(vTexcoord) * sin(fCenterDist - u_fTime * 10.) * RIPPLE_STRENGTH;
    
    vec2 vFinalCoord = vec2(
        mix(u_vUVs.r, u_vUVs.b, vTexcoord.x),
        mix(u_vUVs.g, u_vUVs.a, vTexcoord.y)
    );
    
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, vFinalCoord + vRipple);
}
