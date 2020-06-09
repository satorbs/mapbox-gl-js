uniform mat4 u_matrix;
uniform vec2 u_tl_parent;
uniform float u_scale_parent;
uniform float u_buffer_scale;
uniform lowp float u_ground_ratio;

attribute vec3 a_pos;
attribute vec2 a_texture_pos;

varying vec2 v_pos0;
varying vec2 v_pos1;

void main() {
    gl_Position = u_matrix * vec4(a_pos, 1);

    vec3 ndc = gl_Position.xyz / gl_Position.w;
    float pixheight = ndc.y * 0.5 + 0.5;
    // gl_Position.y = (1.0 - step(u_ground_ratio + 0.1, pixheight) * step(gl_Position.z, 0.9)) * gl_Position.y;

    // We are using Int16 for texture position coordinates to give us enough precision for
    // fractional coordinates. We use 8192 to scale the texture coordinates in the buffer
    // as an arbitrarily high number to preserve adequate precision when rendering.
    // This is also the same value as the EXTENT we are using for our tile buffer pos coordinates,
    // so math for modifying either is consistent.
    v_pos0 = (((a_texture_pos / 8192.0) - 0.5) / u_buffer_scale ) + 0.5;
    v_pos1 = (v_pos0 * u_scale_parent) + u_tl_parent;
}
