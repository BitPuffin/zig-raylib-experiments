const std = @import("std");
const mem = std.mem;
const warn = std.debug.warn;
const rand = std.rand;
var prng = rand.DefaultPrng.init(0);

const CappedArrayList = @import("puffy").CappedArrayList;

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

const Splash = struct {
    x: c_int,
    y: c_int,
    t: f64,
};

const GameCondition = enum {
    PLAYING,
    WON,
    LOST,
};

pub fn Fire(comptime size: usize)
type {
    return struct {
        state: FireState,
        timeout: f64,
        cooldown: f64,

        fn tick(this: *Fire(size))
        void {
            this.timeout += ray.GetFrameTime();
            if (this.timeout > this.cooldown) {
                this.state = .READY;
                this.timeout = 0.0;
            }
        }
        fn attemptFire(
            this: *Fire(size),
            bullets: *CappedArrayList(Bullet, size),
            cooldown: f64,
            x: c_int,
            y: c_int,
            w: c_int)
        void {
            if(bullets.count() < bullets.capacity()) {
                const mid = x + @divFloor(w, 2);
                _ = bullets.append(Bullet { .x = mid, .y = y, }) catch unreachable;
                this.state = .TIMEOUT;
                this.cooldown = cooldown;
            }
        }
    };
}

const Player = struct {
    const max_bullets = 8;
    bullets: CappedArrayList(Bullet, 8),
    fire: Fire(8),
    const fire_cooldown = 0.3;
    pos: c_int,
};

const Face = struct {
    states: [face_count]FaceState,
    death_time: [face_count]f64,
    bullets: CappedArrayList(Bullet, 100),
    const minimum_fire_cooldown = 0.1;
    const maximum_fire_cooldown = 3.0;
    fire: Fire(100),
    pos: c_int,
    direction: c_int,
};

const GameState = struct {
    condition: GameCondition,
    player: Player,
    face: Face,
    splashes: CappedArrayList(Splash, 100),
};

const Assets = struct {
    camera: ray.Texture,
    weary_face : ray.Texture,
    teardrop : ray.Texture,
};

pub fn main()
void {
    Window.init();

    const assets = Assets {
        .camera = ray.LoadTexture(c"selfie-invaders/camera.png"),
        .weary_face = ray.LoadTexture(c"selfie-invaders/weary-face.png"),
        .teardrop = ray.LoadTexture(c"selfie-invaders/droplet.png"),
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

            // draw face bullets
            for(face.bullets.toSlice()) |bull| {
                ray.DrawTexture(assets.teardrop, bull.x, bull.y, ray.WHITE);
            }


            // draw player bullets
            for(player.bullets.toSlice()) |bull| {
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
                            player.fire.attemptFire(
                                &player.bullets,
                                Player.fire_cooldown,
                                player.pos,
                                Window.height - assets.camera.height,
                                assets.camera.width);

                        }
                    },
                    .TIMEOUT => {
                        player.fire.tick();
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

                    // maybe shoot
                    switch(face.fire.state) {
                        .READY => {
                            const min = Face.minimum_fire_cooldown;
                            const max = Face.maximum_fire_cooldown;
                            const range = max - min;
                            const cd = prng.random.float(f64) * range + min;
                            const f = prng.random.intRangeLessThan(
                                usize, 0, face.states.len);
                            const xy =
                                getFaceXY(f, face.pos, face_width, face_height);
                            warn("boom! {}\n", cd);
                            face.fire.attemptFire(
                                &face.bullets,
                                cd,
                                xy.x,
                                xy.y,
                                face_width);
                        },
                        .TIMEOUT => { face.fire.tick(); }
                    }
                }

                // update player bullets
                var remBulls = CappedArrayList(usize, Player.max_bullets).init();
                for(player.bullets.toSlice()) |*bull, idx| {
                    bull.y -= bullet_speed;
                    if(bull.y < -100) {
                        _ = player.bullets.swapRemove(idx);
                    }
                    const bull_x_end = bull.x + bullet_width;
                    const bull_y_end = bull.y + bullet_height;

                    for(face.states) |*fs, i| {
                        if(fs.* != .ALIVE) continue;
                        const xy = getFaceXY(i,
                                             face.pos,
                                             face_width,
                                             face_height);
                        const face_x_end = xy.x + face_width;
                        const face_y_end = xy.y + face_height;
                        const collided = !(xy.x > bull_x_end or
                                           face_x_end < bull.x or
                                           xy.y > bull_y_end or
                                           face_y_end < bull.y);
                        if(collided) {
                            fs.* = .DEAD;
                            _ = player.bullets.swapRemove(idx);
                        }
                    }
                    for(face.bullets.toSlice()) |*fb, i| {
                        const bx_end = fb.x + assets.teardrop.width;
                        const by_end = fb.y + assets.teardrop.height;
                        const collided = !(fb.x > bull_x_end or
                                           bx_end < bull.x or
                                           fb.y > bull_y_end or
                                               by_end < bull.y);
                        if(collided) {
                            _ = face.bullets.swapRemove(i);
                            _ = remBulls.append(idx) catch unreachable;
                        }
                    }
                }

                // update face bullets
                for(face.bullets.toSlice()) |*bull, idx| {
                    bull.y += bullet_speed;
                    if(bull.y > Window.height + 100)
                        _ = face.bullets.swapRemove(idx);
                    const xy = PosXY{ .x = player.pos, .y = player_y };
                    const player_x_end = xy.x + assets.camera.width;
                    const player_y_end = xy.y + assets.camera.height;
                    const bull_x_end = bull.x + bullet_width;
                    const bull_y_end = bull.y + bullet_height;
                    const collided = !(xy.x > bull_x_end or
                                           player_x_end < bull.x or
                                           xy.y > bull_y_end or
                                           player_y_end < bull.y);
                    if(collided) {
                         state.condition = .LOST;
                    }

                }

                // update splashes
                for(state.splashes.toSlice()) |*splash, idx| {
                    splash.t += ray.GetFrameTime();
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
fn getFaceXY(idx: usize, pos: c_int, width: c_int, height: c_int)
PosXY {
    var col = @intCast(c_int, idx % face_per_row);
    var row: c_int = @intCast(c_int, idx / face_per_row);
    const pad = Window.border_padding;
    return PosXY {
        .x = col * (pad + width) + pad + pos,
        .y = row * (height + pad) + pad,
    };
}

fn resetGame(s: *GameState, player_start: c_int)
void {
    @memset(@ptrCast([*]u8, s), 0, @sizeOf(GameState));
    s.player.pos = player_start;
}

