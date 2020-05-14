uniform lowp float u_ground_height;

varying vec4 v_color;

void main() {
    if (u_ground_height * DEVICE_PIXEL_RATIO < gl_FragCoord.y) {
        discard;
    }
    gl_FragColor = v_color;

#ifdef OVERDRAW_INSPECTOR
    gl_FragColor = vec4(1.0);
#endif
}
