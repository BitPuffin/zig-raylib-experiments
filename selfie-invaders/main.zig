const std = @import("std");
const mem = std.mem;
const warn = std.debug.warn;

const ray = @import("ray");

const screenWidth = 1280;
const screen_height = 960;

const face_count = 16;
const face_padding = 30;
const face_per_row = 8;
const face_speed = 8;

const max_bullets = 8;
const bullet_timeout = 0.3;
const max_face_bullets = 4;
const bullet_speed = 12;

const camera_speed = 16;

const screen_offset = 100;
const camera_min = 0 + screen_offset;

const FaceState = packed enum(u2) {
    ALIVE,
    DYING,
    DEAD
};

const FireState = enum {
    READY,
    TIMEOUT
};

// when both x,y = 0, a bullet is considered inactive
const Bullet = struct {
    x: c_int,
    y: c_int,
};

const GameState = struct {
    face_states: [face_count]FaceState,
    time_since_deaths: [face_count]f64,
    player_bullets: [max_bullets]Bullet,
    face_bullets: [max_face_bullets]Bullet,
    fire_state: FireState,
    fire_timeout: f64,
    player_pos: c_int, // x axis only
    face_pos: c_int,
    face_direction: c_int,
};

pub fn main() void {
    ray.InitWindow(screenWidth, screen_height, c"Selfie Invaders");
    ray.SetTargetFPS(60);

    var camera_tex = ray.LoadTexture(c"selfie-invaders/camera.png");
    const camera_max = screenWidth - (camera_tex.width + screen_offset);

    var state: GameState = undefined;
    state.fire_state = FireState.READY;
    state.fire_timeout = 0.0;
    state.player_pos = @divFloor((screenWidth - camera_tex.width), 2); // center
    state.face_direction = 1;
    state.face_pos = 0;
    {   // set zero
        mem.secureZero(f64, state.time_since_deaths[0..]);
        mem.secureZero(FaceState, state.face_states[0..]);
        mem.secureZero(Bullet, state.player_bullets[0..]);
    }

    var wearyFaceTex = ray.LoadTexture(c"selfie-invaders/weary-face.png");
    const FaceXMax = blk: {
        var result: c_int = wearyFaceTex.width + face_padding;
        result *= face_per_row;
        result += face_padding;
        result = screenWidth - result;
        break :blk result;
    };

    while (!ray.WindowShouldClose()) {
        {   // drawing
            ray.BeginDrawing();
            
            ray.ClearBackground(ray.RAYWHITE);
            
            ray.DrawFPS(100,0);
            ray.DrawTexture(camera_tex,
                            @intCast(c_int, state.player_pos),
                            screen_height - camera_tex.height - face_padding,
                            ray.WHITE);

            {   // draw faces
                var row: c_int = 0;
                var xOffset: c_int = 0;
                for(state.face_states) |s, idx| {
                    const ci = @intCast(c_int, idx);
                    if(idx > 0 and idx % face_per_row == 0) {
                        row += 1;
                        xOffset = 0;
                    }
                    if(s == FaceState.ALIVE) {
                        const y = face_padding +
                            row * (wearyFaceTex.height + face_padding);
                        ray.DrawTexture(
                            wearyFaceTex,
                            state.face_pos + face_padding + xOffset,
                            y,
                            ray.WHITE);
                    }
                    xOffset += face_padding + wearyFaceTex.width;
                }
            }

            {  // draw player bullets
                for(state.player_bullets) |bull| {
                    if (isBulletClear(bull)) break;
                    ray.DrawRectangle(bull.x, bull.y, 10, 10, ray.RED);
                }
            }

            ray.EndDrawing();
        }

        {   // update
            {   // update player
                if(ray.IsKeyDown(ray.lib.KEY_LEFT)) {
                    state.player_pos -= camera_speed;
                }
                if(ray.IsKeyDown(ray.lib.KEY_RIGHT)) {
                    state.player_pos += camera_speed;
                }

                if(state.player_pos < camera_min) state.player_pos = camera_min;
                if(state.player_pos > camera_max) state.player_pos = camera_max;

                switch(state.fire_state) {
                    .READY => {
                        if(ray.IsKeyDown(ray.lib.KEY_SPACE)) {
                            const ac = countActiveBullets(state.player_bullets[0..]);
                            if(ac < max_bullets) {
                                state.player_bullets[ac] = Bullet {
                                    .x = state.player_pos + @divFloor(camera_tex.width, 2),
                                    .y = screen_height - camera_tex.height,
                                };
                                state.fire_state = .TIMEOUT;
                            }
                        }
                    },
                    .TIMEOUT => {
                        state.fire_timeout += ray.GetFrameTime();
                        if (state.fire_timeout > bullet_timeout) {
                            state.fire_state = .READY;
                            state.fire_timeout = 0.0;
                        }
                    }
                }
            }

            {  // update faces
                state.face_pos += face_speed * state.face_direction;

                if(state.face_direction == 1
                       and state.face_pos > FaceXMax) {
                    state.face_direction = -1;
                    state.face_pos = FaceXMax;
                } else if(state.face_direction == -1
                              and state.face_pos < 0) {
                    state.face_direction = 1;
                    state.face_pos = 0;
                }
            }

            {   // update player bullets
                for(state.player_bullets) |*bull, idx| {
                    if(isBulletClear(bull.*)) break;
                    bull.y -= bullet_speed;
                    if(bull.y < -100) {
                        freeBulletAt(state.player_bullets[0..], idx);
                    }
                }
            }
        }
    }
}

fn isBulletClear(bull: Bullet) bool { return bull.x == 0 and bull.y == 0; }
fn clearBullet(bull: *Bullet) void { bull.x = 0; bull.y = 0; }
fn freeBulletAt(bulls: []Bullet, idx: usize) void {
    const last_active = countActiveBullets(bulls) - 1;
    bulls[idx] = bulls[last_active];
    clearBullet(&bulls[last_active]);
 
}

fn countActiveBullets(bulls: []Bullet) usize {
    var count: usize = 0;
    for(bulls) |bull, idx| {
        if (isBulletClear(bull)) {
            break;
        } else count += 1;
    }
    return count;
}
