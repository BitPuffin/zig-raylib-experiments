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

const PersonCount = 16;
const MaxBullets = 8;
const MaxPersonBullets = 4;

const cameraSpeed = 16;

const screenMinOffset = 100;
const screenMaxOffset = 250;
const cameraMin = 0 + screenMinOffset;
const cameraMax = screenWidth - screenMaxOffset;

const PersonState = enum {
    ALIVE,
    DYING,
    DEAD
};

const GameState = struct {
    personStates: [PersonCount]PersonState,
    timeSinceDeaths: [PersonCount]f64,
    playerPos: i64, // x axis only
};

pub fn main() void {
    warn("Initializing...\n");
    ray.InitWindow(screenWidth, screenHeight, c"Selfie Invaders");

    ray.SetTargetFPS(60);

    var state: GameState = undefined;
    state.playerPos = 400;

    var cameraImg = ray.LoadTexture(c"selfie-invaders/camera.png");
    var wearyFaceImg = ray.LoadTexture(c"selfie-invaders/weary-face.png");

    while (!ray.WindowShouldClose()) {
        ray.BeginDrawing();
        ray.ClearBackground(ray.RAYWHITE);

        ray.DrawTexture(cameraImg, @intCast(c_int, state.playerPos), 550, ray.WHITE);

        if(ray.IsKeyDown(ray.lib.KEY_LEFT)) {
            state.playerPos -= cameraSpeed;
        }
        if(ray.IsKeyDown(ray.lib.KEY_RIGHT)) {
            state.playerPos += cameraSpeed;
        }

        if(state.playerPos < cameraMin) state.playerPos = cameraMin;
        if(state.playerPos > cameraMax) state.playerPos = cameraMax;

        ray.EndDrawing();
    }
}
