const std = @import("std");
const mem = std.mem;
const warn = std.debug.warn;

const ray = @import("ray");

const screenWidth = 1280;
const screenHeight = 960;

const PersonCount = 16;
const PersonPadding = 30;

const MaxBullets = 8;
const MaxPersonBullets = 4;

const cameraSpeed = 16;

const screenOffset = 100;
const cameraMin = 0 + screenOffset;

const PersonState = packed enum(u2) {
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
    ray.InitWindow(screenWidth, screenHeight, c"Selfie Invaders");
    ray.SetTargetFPS(60);

    var cameraTex = ray.LoadTexture(c"selfie-invaders/camera.png");
    const cameraMax = screenWidth - (cameraTex.width + screenOffset);

    var state: GameState = undefined;
    state.playerPos = @divFloor((screenWidth - cameraTex.width), 2); // center
    {   // set zero
        mem.secureZero(f64, state.timeSinceDeaths[0..]);
        mem.secureZero(PersonState, state.personStates[0..]);
    }

    var wearyFaceTex = ray.LoadTexture(c"selfie-invaders/weary-face.png");

    while (!ray.WindowShouldClose()) {
        {   // drawing
            ray.BeginDrawing();
            
            ray.ClearBackground(ray.RAYWHITE);
            
            ray.DrawFPS(100,0);
            ray.DrawTexture(cameraTex,
                            @intCast(c_int, state.playerPos),
                            screenHeight - cameraTex.height - PersonPadding,
                            ray.WHITE);

            {   // draw faces
                var row: c_int = 0;
                var xOffset: c_int = 0;
                for(state.personStates) |s, idx| {
                    const ci = @intCast(c_int, idx);
                    if(idx > 0 and idx % 8 == 0) {
                        row += 1;
                        xOffset = 0;
                    }
                    if(s == PersonState.ALIVE) {
                        const y = PersonPadding +
                            row * (wearyFaceTex.height + PersonPadding);
                        ray.DrawTexture(
                            wearyFaceTex,
                            PersonPadding + xOffset,
                            y,
                            ray.WHITE);
                    }
                    xOffset += PersonPadding + wearyFaceTex.width;
                }
            }

            ray.EndDrawing();
        }

        {   // update
            if(ray.IsKeyDown(ray.lib.KEY_LEFT)) {
                state.playerPos -= cameraSpeed;
            }
            if(ray.IsKeyDown(ray.lib.KEY_RIGHT)) {
                state.playerPos += cameraSpeed;
            }

            if(state.playerPos < cameraMin) state.playerPos = cameraMin;
            if(state.playerPos > cameraMax) state.playerPos = cameraMax;
        }
        warn("time: {}\n", ray.GetFrameTime());
    }
}
