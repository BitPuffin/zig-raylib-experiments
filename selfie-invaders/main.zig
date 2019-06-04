const std = @import("std");
const warn = std.debug.warn;

// const ray = @cImport({
//     // @cDefine("_NO_CRT_STDIO_INLINE", "1");
//     // @cDefine("_GNU_SOURCE", "1");
//     // @cDefine("PLATFORM", "PLATFORM_DESKTOP");
//     @cInclude("raylib.h");
// });

const ray = @import("ray");

const screenWidth = 1280;
const screenHeight = 720;

pub fn main() void {
    warn("Initializing...\n");
    ray.InitWindow(screenWidth, screenHeight, c"Selfie Invaders");

    while (!ray.WindowShouldClose()) {
        ray.BeginDrawing();
        ray.ClearBackground(ray.RAYWHITE);
        ray.DrawText(c"My first raylib window!", 190, 200, 20, ray.LIGHTGRAY);
        ray.EndDrawing();
    }
}
