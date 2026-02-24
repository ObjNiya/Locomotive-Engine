//
// Simple passthrough fragment shader
//
varying vec3 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_fCircleRadius;
uniform vec2 u_vCirclePos;
uniform vec2 u_vRoomSize;

#define CIRCLE_BORDER_SIZE 0.

void main()
{
    float fCircleAlpha = 0.;
    
    fCircleAlpha = distance(v_vPosition.xy, u_vCirclePos);
    fCircleAlpha = smoothstep(fCircleAlpha - CIRCLE_BORDER_SIZE, fCircleAlpha, u_fCircleRadius);
    
    if (fCircleAlpha < 1. && fCircleAlpha > 0.)
    {
        gl_FragColor = vec4(1.);
        return;
    }
    
    vec4 vBaseTexColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    vBaseTexColor.a = max(vBaseTexColor.a - fCircleAlpha, 0.);
    
    gl_FragColor = vBaseTexColor;
}
