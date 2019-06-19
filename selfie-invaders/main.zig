const std = @import("std");
const mem = std.mem;
const warn = std.debug.warn;

const ray = @import("ray");
const easings = @cImport({ @cInclude("easings.h"); });

const Window = struct {
    const width = 1280;
    const height = 960;
    const title = c"Selfie Invaders";
    const border_padding = 30;
    const padded_border = MinMax {
        .min = 0 + border_padding,
        .max = width - border_padding,
    };

    pub fn init() void {
        ray.InitWindow(width, height, title);
        ray.SetTargetFPS(60);
    }
};

const MinMax = struct { min: c_int, max: c_int };

const face_count = 16;
const face_per_row = 8;
const face_speed = 8;

const bullet_speed = 16;
const bullet_width = 10;
const bullet_height = 20;

const camera_speed = 16;
const camera_hitbox_shrink_y = 20;
const camera_hitbox_shrink_x = 10;

const screen_offset = 100;
const camera_min = 0 + screen_offset;

const FaceState = enum {
    ALIVE,
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

const GameCondition = enum {
    PLAYING,
    WON,
    LOST,
};

const Fire = struct {
    const timeout_limit = 0.3;
    state: FireState,
    timeout: f64,
};

const Player = struct {
    bullets: [8]Bullet,
    fire: Fire,
    pos: c_int,
};

const Face = struct {
    states: [face_count]FaceState,
    death_time: [face_count]f64,
    bullets: [4]Bullet,
    fire: Fire,
    pos: c_int,
    direction: c_int,
};

const GameState = struct {
    condition: GameCondition,
    player: Player,
    face: Face,
};

const Assets = struct {
    camera: ray.Texture,
    weary_face : ray.Texture,
};

pub fn main() void
{
    Window.init();

    const assets = Assets {
        .camera = ray.LoadTexture(c"selfie-invaders/camera.png"),
        .weary_face = ray.LoadTexture(c"selfie-invaders/weary-face.png"),
    };

    const player_y = Window.height - assets.camera.height - Window.border_padding;
    const camera_max = Window.width - (assets.camera.width + screen_offset);
    const player_starting_pos = @divFloor((Window.width - assets.camera.width), 2);

    var state: GameState = undefined;
    var player = &state.player;
    var face = &state.face;
    resetGame(&state, player_starting_pos);

    var debug_drawing = false;

    const face_width = assets.weary_face.width;
    const face_height = assets.weary_face.height;

    while (!ray.WindowShouldClose()) {
        {   // drawing
            ray.BeginDrawing();
            ray.ClearBackground(ray.WHITE);

            // draw player
            ray.DrawTexture(assets.camera, player.pos, player_y, ray.WHITE);

            // draw faces
            for(face.states) |s, idx| {
                switch(s) {
                    .ALIVE => {
                        const xy =
                            getFaceXY(idx, face.pos, face_width, face_height);
                        ray.DrawTexture(assets.weary_face, xy.x, xy.y, ray.WHITE);
                    },
                    .DEAD => {
                        //easings.EaseLinearOut(face.death_time[idx],);
                    }
                }
            }

            // draw player bullets
            for(player.bullets) |bull| {
                if (isBulletClear(bull)) break;
                ray.DrawRectangle(bull.x,
                                  bull.y,
                                  bullet_width,
                                  bullet_height,
                                  ray.GOLD);
            }

            {   // display status message
                const fns = struct {
                    fn drawStatus(str: [*]const u8) void {
                        ray.DrawText(str, 50, 100, 32, ray.BLACK);
                    }
                };
                switch(state.condition) {
                    .PLAYING => {},
                    .WON => {
                        fns.drawStatus(c"Congratulations! (space for reset)");
                    },
                    .LOST => {
                        fns.drawStatus(c"Too bad! Try again! (space for reset)");
                    }
                }
            }

            if(debug_drawing) {
                ray.DrawFPS(100,0);
                ray.DrawRectangleLines(player.pos + camera_hitbox_shrink_x,
                                       player_y + camera_hitbox_shrink_y,
                                       assets.camera.width - camera_hitbox_shrink_x*2,
                                       assets.camera.height - camera_hitbox_shrink_x*2,
                                       ray.PURPLE);
                for(face.states) |s, idx| {
                    if(s == .ALIVE) {
                        const xy = getFaceXY(idx, face.pos, face_width, face_height);
                        ray.DrawRectangleLines(
                            xy.x,
                            xy.y,
                            face_width,
                            face_height,
                            ray.PURPLE);
                    }
                }
            }

            ray.EndDrawing();
        }

        // update
        switch(state.condition) {
            .PLAYING => {
                // update player
                if(ray.IsKeyDown(ray.KEY_LEFT)) {
                    player.pos -= camera_speed;
                }
                if(ray.IsKeyDown(ray.KEY_RIGHT)) {
                    player.pos += camera_speed;
                }

                if(player.pos < camera_min) player.pos = camera_min;
                if(player.pos > camera_max) player.pos = camera_max;

                switch(player.fire.state) {
                    .READY => {
                        if(ray.IsKeyDown(ray.KEY_SPACE)) {
                            const ac = countBullets(player.bullets[0..]);
                            if(ac < player.bullets.len) {
                                const player_mid =
                                    player.pos +
                                    @divFloor(assets.camera.width, 2);
                                const bullet_start_y =
                                    Window.height -
                                    assets.camera.height;
                                player.bullets[ac] = Bullet {
                                    .x = player_mid,
                                    .y = bullet_start_y,
                                };

                                player.fire.state = .TIMEOUT;
                            }
                        }
                    },
                    .TIMEOUT => {
                        player.fire.timeout += ray.GetFrameTime();
                        if (player.fire.timeout > Fire.timeout_limit) {
                            player.fire.state = .READY;
                            player.fire.timeout = 0.0;
                        }
                    }
                }

                {  // update faces
                    face.pos += face_speed * (1 - (2 * face.direction));

                    const old_condition = state.condition;
                    state.condition = .WON; // attempt to win
                    for(face.states) |s, i| {
                        if(s == .ALIVE) {
                            state.condition = old_condition; // didn't win

                            var xy = getFaceXY(i,
                                               face.pos,
                                               face_width,
                                               face_height);

                            if(xy.x < Window.padded_border.min) {
                                face.pos += Window.padded_border.min - xy.x;
                                face.direction = 0;
                            }
                            const rightx = xy.x + face_width;
                            if(rightx > Window.padded_border.max) {
                                face.pos -= rightx - Window.padded_border.max;
                                face.direction = 1;
                            }
                        }
                    }
                }

                // update player bullets
                for(player.bullets) |*bull, idx| {
                    if(isBulletClear(bull.*)) break;
                    bull.y -= bullet_speed;
                    if(bull.y < -100) {
                        freeBulletAt(player.bullets[0..], idx);
                    }
                    for(face.states) |*fs, i| {
                        if(fs.* != .ALIVE) continue;
                        const xy = getFaceXY(i,
                                             face.pos,
                                             face_width,
                                             face_height);
                        const face_x_end = xy.x + face_width;
                        const face_y_end = xy.y + face_height;
                        const bull_x_end = bull.x + bullet_width;
                        const bull_y_end = bull.y + bullet_height;
                        const collided = !(xy.x > bull_x_end or
                                           face_x_end < bull.x or
                                           xy.y > bull_y_end or
                                           face_y_end < bull.y);
                        if(collided) {
                            fs.* = .DEAD;
                            freeBulletAt(player.bullets[0..], idx);
                        }
                    }
                }
            },
            .WON, .LOST => {
                if(ray.IsKeyPressed(ray.KEY_SPACE)) {
                    resetGame(&state, player_starting_pos);
                    player.fire.state = .TIMEOUT;
                }
            }
        }

        // update debug
        if(ray.IsKeyPressed(ray.KEY_D)) {
            debug_drawing = !debug_drawing;
        }
    }
}

const PosXY = struct { x: c_int, y: c_int };
fn getFaceXY(idx: usize, pos: c_int, width: c_int, height: c_int) PosXY
{
    var col = @intCast(c_int, idx % face_per_row);
    var row: c_int = @intCast(c_int, idx / face_per_row);
    const pad = Window.border_padding;
    return PosXY {
        .x = col * (pad + width) + pad + pos,
        .y = row * (height + pad) + pad,
    };
}

fn isBulletClear(bull: Bullet) bool { return bull.x == 0 and bull.y == 0; }
fn clearBullet(bull: *Bullet) void { bull.x = 0; bull.y = 0; }
fn freeBulletAt(bulls: []Bullet, idx: usize) void
{
    const last = countBullets(bulls) - 1;
    bulls[idx] = bulls[last];
    clearBullet(&bulls[last]);
}

fn countBullets(bulls: []Bullet) usize
{
    var count: usize = 0;
    for(bulls) |b| {
        if (isBulletClear(b)) { break; }
        else { count += 1; }
    }
    return count;
}

fn resetGame(s: *GameState, player_start: c_int) void
{
    @memset(@ptrCast([*]u8, s), 0, @sizeOf(GameState));
    s.player.pos = player_start;
}
