const std = @import("std");
const mem = std.mem;
const warn = std.debug.warn;

const ray = @import("ray");

const screenWidth = 1280;
const screenHeight = 960;

const FaceCount = 16;
const FacePadding = 30;
const FacePerRow = 8;
const FaceSpeed = 8;

const MaxBullets = 8;
const MaxFaceBullets = 4;

const cameraSpeed = 16;

const screenOffset = 100;
const cameraMin = 0 + screenOffset;

const FaceState = packed enum(u2) {
    ALIVE,
    DYING,
    DEAD
};

const GameState = struct {
    faceStates: [FaceCount]FaceState,
    timeSinceDeaths: [FaceCount]f64,
    playerPos: c_int, // x axis only
    facePos: c_int,
    faceDirection: c_int,
};

pub fn main() void {
    ray.InitWindow(screenWidth, screenHeight, c"Selfie Invaders");
    ray.SetTargetFPS(60);

    var cameraTex = ray.LoadTexture(c"selfie-invaders/camera.png");
    const cameraMax = screenWidth - (cameraTex.width + screenOffset);

    var state: GameState = undefined;
    state.playerPos = @divFloor((screenWidth - cameraTex.width), 2); // center
    state.faceDirection = 1;
    state.facePos = 0;
    {   // set zero
        mem.secureZero(f64, state.timeSinceDeaths[0..]);
        mem.secureZero(FaceState, state.faceStates[0..]);
    }

    var wearyFaceTex = ray.LoadTexture(c"selfie-invaders/weary-face.png");
    const FaceXMax = blk: {
        var result: c_int = wearyFaceTex.width + FacePadding;
        result *= FacePerRow;
        result += FacePadding;
        result = screenWidth - result;
        break :blk result;
    };

    while (!ray.WindowShouldClose()) {
        {   // drawing
            ray.BeginDrawing();
            
            ray.ClearBackground(ray.RAYWHITE);
            
            ray.DrawFPS(100,0);
            ray.DrawTexture(cameraTex,
                            @intCast(c_int, state.playerPos),
                            screenHeight - cameraTex.height - FacePadding,
                            ray.WHITE);

            {   // draw faces
                var row: c_int = 0;
                var xOffset: c_int = 0;
                for(state.faceStates) |s, idx| {
                    const ci = @intCast(c_int, idx);
                    if(idx > 0 and idx % FacePerRow == 0) {
                        row += 1;
                        xOffset = 0;
                    }
                    if(s == FaceState.ALIVE) {
                        const y = FacePadding +
                            row * (wearyFaceTex.height + FacePadding);
                        ray.DrawTexture(
                            wearyFaceTex,
                            state.facePos + FacePadding + xOffset,
                            y,
                            ray.WHITE);
                    }
                    xOffset += FacePadding + wearyFaceTex.width;
                }
            }

            ray.EndDrawing();
        }

        {   // update
            {   // update player
                if(ray.IsKeyDown(ray.lib.KEY_LEFT)) {
                    state.playerPos -= cameraSpeed;
                }
                if(ray.IsKeyDown(ray.lib.KEY_RIGHT)) {
                    state.playerPos += cameraSpeed;
                }

                if(state.playerPos < cameraMin) state.playerPos = cameraMin;
                if(state.playerPos > cameraMax) state.playerPos = cameraMax;
            }

            {  // update people
                state.facePos += FaceSpeed * state.faceDirection;

                if(state.faceDirection == 1
                       and state.facePos > FaceXMax) {
                    state.faceDirection = -1;
                    state.facePos = FaceXMax;
                } else if(state.faceDirection == -1
                              and state.facePos < 0) {
                    state.faceDirection = 1;
                    state.facePos = 0;
                }
            }
        }
        warn("time: {}\n", ray.GetFrameTime());
    }
}
