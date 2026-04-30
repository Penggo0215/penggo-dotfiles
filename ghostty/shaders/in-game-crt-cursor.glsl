// In-game CRT shader
// Author: sarphiv
// License: CC BY-NC-SA 4.0
// Description:
//   Simplified for pure smooth transitions without flashes or glow.

#define TRAIL_MIN_DISTANCE 0.001
#define TIME_DURATION_FACTOR 0.12
#define EPS 1e-9

float min_(float a, float b, float c) { return min(a, min(b, c)); }
float max_(float a, float b, float c) { return max(a, max(b, c)); }

float sdRectangle(vec2 p, vec2 topLeft, vec2 size) {
    vec2 center = topLeft + vec2(size.x, -size.y) * 0.5;
    vec2 d = abs(p - center) - size * 0.5;
    return length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
}

float sdSeg(vec2 p, vec2 a) {
    vec2 c = a * clamp(dot(p, a) / (dot(a, a) + EPS), 0., 1.) - p;
    return sqrt(dot(c, c));
}

float sdTriangle(vec2 p, vec2 a, vec2 b, vec2 c) {
    a -= p; b -= p; c -= p;
    vec3 t = cross(vec3(a.x, b.x, c.x), vec3(a.y, b.y, c.y));
    vec2 m = vec2(min_(t.x, t.y, t.z), max_(t.x, t.y, t.z));
    float s = -1. + 2. * step(m.x, 0.) * step(0., m.y);
    return s * min_(sdSeg(a, a - b), sdSeg(b, b - c), sdSeg(c, c - a));
}

float sdTrail(vec2 p, vec2 currPos, vec2 currSize, vec2 prevPos, vec2 prevSize, float t) {
    // Interpolate position and size for a smooth sliding effect during input
    vec2 movingPos = mix(prevPos, currPos, t);
    vec2 movingSize = mix(prevSize, currSize, t);
    vec2 movingCenter = movingPos + movingSize * vec2(0.5, -0.5);
    vec2 prevCenter = prevPos + prevSize * vec2(0.5, -0.5);
    
    if (distance(movingCenter, prevCenter) < TRAIL_MIN_DISTANCE) return max(sdRectangle(p, movingPos, movingSize), 0.0);
    
    // Corners of the moving cursor to form the trail from the previous position
    vec2[4] corners = { movingPos, movingPos + vec2(movingSize.x, 0.0), movingPos + vec2(movingSize.x, -movingSize.y), movingPos + vec2(0.0, -movingSize.y) };
    vec2 triB = corners[0], triC = corners[0], dir = normalize(movingCenter - prevCenter);
    float minRel = 1e10, maxRel = -1e10;
    for (int i = 0; i < 4; ++i) {
        vec2 delta = corners[i] - prevCenter;
        float rel = atan(dir.x * delta.y - dir.y * delta.x, dot(dir, delta));
        if (rel < minRel) { minRel = rel; triB = corners[i]; }
        if (rel > maxRel) { maxRel = rel; triC = corners[i]; }
    }
    float rectDist = max(sdRectangle(p, movingPos, movingSize), 0.0);
    float triDist = max(sdTriangle(p, prevCenter, triB, triC), 0.0);
    // 保持纯粹的三角形拖影，避免 mix 插值导致的形状扭曲（变圆或变胖）
    return min(rectDist, triDist);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord.xy / iResolution.xy;
    fragColor = texture(iChannel0, uv);
    vec2 currPos = iCurrentCursor.xy / iResolution.xy, currSize = iCurrentCursor.zw / iResolution.xy;
    vec2 prevPos = iPreviousCursor.xy / iResolution.xy, prevSize = iPreviousCursor.zw / iResolution.xy;
    float tProgress = clamp((iTime - iTimeCursorChange) / TIME_DURATION_FACTOR, 0.0, 1.0);
    float tShape = 1.0 - pow(1.0 - tProgress, 3.0);
    float tVisible = 1.0 - tProgress * tProgress;
    float dTrail = sdTrail(uv, currPos, currSize, prevPos, prevSize, tShape);
    float trailAlpha = 1.0 - smoothstep(0.0, 0.005, dTrail);
    if (trailAlpha > 0.0) {
        fragColor = mix(fragColor, iCurrentCursorColor, trailAlpha * tVisible * 0.8);
    }
}
