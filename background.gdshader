shader_type canvas_item;

uniform sampler2D background_texture;
uniform vec2 uv_offset = vec2(0.0);

void fragment() {
	COLOR = texture(background_texture,UV+(uv_offset*TEXTURE_PIXEL_SIZE));
}
