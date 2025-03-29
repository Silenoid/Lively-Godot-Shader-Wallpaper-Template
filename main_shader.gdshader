shader_type canvas_item;

float smoothNoise(vec2 p) {
	vec2 f = fract(p);
	p-=f;
	f *= f*(3.0-f-f);
	vec4 val = fract(sin(vec4(0, 1, 27, 28) + p.x+p.y*27.) * 100.0);
    return dot(mat2(val.xy, val.zw)*vec2(1.-f.y,f.y), vec2(1.-f.x, f.x));
}

float fractalNoise(vec2 p) {
    return smoothNoise(p)*0.5333 + smoothNoise(p*2.0)*0.2667 + smoothNoise(p*4.0)*0.1333 + smoothNoise(p*8.0)*0.0667;
}

float warpedNoise(vec2 p) {
    vec2 m = vec2(TIME, -TIME)*0.05;
    float x = fractalNoise(p + m);
    float y = fractalNoise(p + m.yx + x);
    float z = fractalNoise(p - m - x + y);
    return fractalNoise(p + vec2(x, y) + vec2(y, z) + vec2(z, x) + length(vec3(x, y, z))*0.25);
}

void fragment() {
	vec2 uv = FRAGCOORD.xy / (1.0 / SCREEN_PIXEL_SIZE).y;

    float n = warpedNoise(uv * 6.);
    float n2 = warpedNoise(uv * 6. + 0.01);

    float bump = max(n2 - n, 0.0)/0.02*0.7071;
    float bump2 = max(n - n2, 0.0)/0.02*0.7071;

    bump = bump*bump*.5 + pow(bump, 4.)*.5;
    bump2 = bump2*bump2*.5 + pow(bump2, 4.)*.5;

    vec3 col = n*n*(vec3(1, 0.7, 0.6)*vec3(bump, (bump + bump2)*0.4, bump2)*0.2 + 0.5);
	COLOR = vec4(sqrt(max(col, vec3(0.0))), 1.0);
}