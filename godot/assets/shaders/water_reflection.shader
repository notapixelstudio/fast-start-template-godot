shader_type canvas_item;

// from: https://github.com/securas/Daisy_Dangerous

uniform sampler2D disp2;

void fragment()
{
vec2 offset = UV;
offset.x += fract( TIME * 0.05 );
vec2 d1 = texture( TEXTURE, offset ).rg;

vec2 offset2 = UV;
offset2.x -= fract( TIME * 0.0489 );
vec2 d2 = texture( disp2, offset2 ).rg;

float screen_h = 180.0;
float sprite_h = 64.0;
float sprite_uv_h = sprite_h / screen_h;
//vec2 flipped_screen_uv = vec2( SCREEN_UV.x, SCREEN_UV.y - sprite_uv_h * ( 1.0 - 2.0 * UV.y) );
vec2 flipped_screen_uv = vec2( SCREEN_UV.x, ( SCREEN_UV.y - sprite_uv_h * ( 1.0 - 2.0 * UV.y) + sprite_uv_h )* 1.2 );
flipped_screen_uv += d1 * 0.02 - d2 * 0.015;

//vec4 color = vec4( texture( SCREEN_TEXTURE, flipped_screen_uv ).rgb, 1.0);
//COLOR = mix( color, vec4( 0.8, 0.8, 1.0, 1.0 ), 0.5 );

vec3 r_col = texture( SCREEN_TEXTURE, flipped_screen_uv ).rgb;
COLOR.rgb = vec3(0,0,0);
COLOR.rgb += r_col + vec3(d1 * d2, 0.0) * 0.1 - vec3(0.4,0.2,0.1) * (1.0-UV.y + 0.1);
//COLOR.rgb += vec3(0.3,0.2,0.1) * (1.0 - dot(d1, d2));


}
