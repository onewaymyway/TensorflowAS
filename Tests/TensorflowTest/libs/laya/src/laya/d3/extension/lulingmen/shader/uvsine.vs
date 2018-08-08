attribute vec4 a_Position;
attribute vec3 a_Normal;
attribute vec2 a_Texcoord0;

uniform mat4 u_MvpMatrix;
uniform float u_Time;
uniform vec2 u_BaseScrollSpeed;
uniform vec2 u_SecondScrollSpeed;

uniform vec4 u_TilingOffset1;
uniform vec4 u_TilingOffset2;

varying vec2 v_Texcoord0;
varying vec2 v_Texcoord1;

void main()
{
	v_Texcoord0 = a_Texcoord0;
	#ifdef TILINGOFFSET1
		v_Texcoord0 = (vec2(v_Texcoord0.x, v_Texcoord0.y - 1.0) * u_TilingOffset1.xy) + u_TilingOffset1.zw;
	#else
		v_Texcoord0 = vec2(v_Texcoord0.x, 1.0 + v_Texcoord0.y);
	#endif
	
	v_Texcoord1 = a_Texcoord0;
	#ifdef TILINGOFFSET2
		v_Texcoord1 = (vec2(v_Texcoord1.x, v_Texcoord1.y - 1.0) * u_TilingOffset2.xy) + u_TilingOffset2.zw;
	#else
		v_Texcoord1 = vec2(v_Texcoord1.x, 1.0 + v_Texcoord1.y);
	#endif
	
	v_Texcoord0 = v_Texcoord0 + vec2(fract(u_BaseScrollSpeed.x * u_Time / 20.0), fract(u_BaseScrollSpeed.y * u_Time));
	v_Texcoord1 = v_Texcoord1 + vec2(fract(u_SecondScrollSpeed.x * u_Time / 20.0), fract(u_SecondScrollSpeed.y * u_Time));
	
	gl_Position = u_MvpMatrix * a_Position;
}