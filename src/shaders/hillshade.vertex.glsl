uniform mat4 u_matrix;

uniform sampler2D u_image;

attribute vec2 a_pos;
attribute vec2 a_texture_pos;

varying vec2 v_pos;

float getElevation(vec2 coord) {
    vec4 pixel = texture2D(u_image, coord);
    return ((pixel.r * 256.0 * 256.0 + pixel.g * 256.0 + pixel.b) * 0.1) -10000.0;
}

void main() {
    v_pos = a_texture_pos / 8192.0;
    float elevation = getElevation(v_pos);
    gl_Position = u_matrix * vec4(a_pos, 0, 1);
}
