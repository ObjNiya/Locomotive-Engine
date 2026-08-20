varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 u_vDepthFog;

void main() {
	vec4 vFragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	vFragColor.rgb = mix(vFragColor.rgb, u_vDepthFog.rgb, u_vDepthFog.a);
	
	gl_FragColor = vFragColor;
}