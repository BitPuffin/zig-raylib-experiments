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

const camera_hitbox_shrink_y = 20;
const camera_hitbox_shrink_x = 10;

const screen_offset = 100;

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
    fire: Fire(max_bullets),
    const fire_cooldown = 0.3;
    pos: c_int,
};

const Face = struct {
    const max_bullets = 20;
    states: [face_count]FaceState,
    death_time: [face_count]f64,
    dead_count: usize,
    bullets: CappedArrayList(Bullet, max_bullets),
    const minimum_fire_cooldown = 0.1;
    const maximum_fire_cooldown = 3.0;
    fire: Fire(max_bullets),
    pos: c_int,
    direction: c_int,
};

const GameState = struct {
    condition: GameCondition,
    player: Player,
    face: Face,
    splashes: CappedArrayList(Splash, Face.max_bullets * 2), // overkill
};

const Assets = struct {
    camera: ray.Texture,
    weary_face : ray.Texture,
    teardrop : ray.Texture,
};

const PlayerInfo = struct {
    const min_pos = screen_offset;
    const speed = 16;

    width: c_int,
    height: c_int,
    y: c_int,
    starting_pos: c_int,
    max_pos: c_int,
    bullet: BulletInfo,
};

const FaceInfo = struct {
    width: c_int,
    height: c_int,
    bullet: BulletInfo,
};

const BulletInfo = struct {
    width: c_int,
    height: c_int,
    const speed = 16;
};

const Info = struct {
    player: PlayerInfo,
    face: FaceInfo,
};

pub fn main()
void {
    Window.init();

    const assets = Assets {
        .camera = ray.LoadTexture(c"selfie-invaders/camera.png"),
        .weary_face = ray.LoadTexture(c"selfie-invaders/weary-face.png"),
        .teardrop = ray.LoadTexture(c"selfie-invaders/droplet.png"),
    };

    const info = block: {
        const pw = assets.camera.width;
        break :block Info {
            .player = PlayerInfo {
                .width = pw,
                .height = assets.camera.height,
                .y = Window.height - assets.camera.height - Window.border_padding,
                .starting_pos = @divFloor((Window.width - assets.camera.width), 2),
                .max_pos = @intCast(c_int, Window.width - (pw + screen_offset)),
                .bullet = BulletInfo {
                    .width = 10,
                    .height = 20,
                }
            },
            .face = FaceInfo {
                .width = assets.weary_face.width,
                .height = assets.weary_face.height,
                .bullet = BulletInfo {
                    .width = assets.teardrop.width,
                    .height = assets.teardrop.height,
                }
            }
        };
    };

    //const camera_max = 

    var state: GameState = undefined;
    resetGame(&state, &info);

    const face_width = assets.weary_face.width;
    const face_height = assets.weary_face.height;

    while (!ray.WindowShouldClose()) {
        draw(&assets, &state, &info);
        update(&state, &info);
    }
}

var debug_drawing = false;

fn draw(assets: *const Assets, state: *const GameState, info: *const Info)
void {
    const player = &state.player; 
    const face = &state.face;
    ray.BeginDrawing();
    ray.ClearBackground(ray.WHITE);

    // draw player
    ray.DrawTexture(assets.camera, player.pos, info.player.y, ray.WHITE);

    // draw faces
    for(face.states) |s, idx| {
        switch(s) {
            .ALIVE => {
                const xy =
                    getFaceXY(idx, face.pos, info.face.width, info.face.height);
                ray.DrawTexture(assets.weary_face, xy.x, xy.y, ray.WHITE);
            },
            .DEAD => {
                //easings.EaseLinearOut(face.death_time[idx],);
            }
        }
    }

    // draw face bullets
    for(face.bullets.toSliceConst()) |bull| {
        ray.DrawTexture(assets.teardrop, bull.x, bull.y, ray.WHITE);
    }


    // draw player bullets
    for(player.bullets.toSliceConst()) |bull| {
        ray.DrawRectangle(bull.x,
                          bull.y,
                          info.player.bullet.width,
                          info.player.bullet.height,
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
                               info.player.y + camera_hitbox_shrink_y,
                               assets.camera.width - camera_hitbox_shrink_x*2,
                               assets.camera.height - camera_hitbox_shrink_x*2,
                               ray.PURPLE);
        for(face.states) |s, idx| {
            if(s == .ALIVE) {
                const w = info.face.width;
                const h = info.face.height;
                const xy = getFaceXY(idx, face.pos, w, h);
                ray.DrawRectangleLines(xy.x, xy.y, w, h, ray.PURPLE);
            }
        }
    }

    ray.EndDrawing();
}

fn update(state: *GameState, info: *const Info)
void {
    var player = &state.player;
    var face = &state.face;
    switch(state.condition) {
        .PLAYING => {
            // update player
            if(ray.IsKeyDown(ray.KEY_LEFT)) {
                player.pos -= PlayerInfo.speed;
            }
            if(ray.IsKeyDown(ray.KEY_RIGHT)) {
                player.pos += PlayerInfo.speed;
            }

            {
                const min = PlayerInfo.min_pos;
                const max = info.player.max_pos;
                if(player.pos < min) player.pos = min;
                if(player.pos > max) player.pos = max;
            }

            switch(player.fire.state) {
                .READY => {
                    if(ray.IsKeyDown(ray.KEY_SPACE)) {
                        player.fire.attemptFire(
                            &player.bullets,
                            Player.fire_cooldown,
                            player.pos,
                            Window.height - info.player.height,
                            info.player.width);

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
                                           info.face.width,
                                           info.face.height);

                        if(xy.x < Window.padded_border.min) {
                            face.pos += Window.padded_border.min - xy.x;
                            face.direction = 0;
                        }
                        const rightx = xy.x + info.face.width;
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
                        const fth = prng.random.intRangeLessThan(
                            usize, 0, face.states.len - face.dead_count);
                        var fc: usize = 0;
                        var i: usize = 0;
                        const f = while(i < face.states.len) : (i += 1) {
                            const s = face.states[i];
                            if(s == .ALIVE) {
                                if(fc == fth) break i;
                                fc += 1;
                            }
                        } else unreachable;
                        const w = info.face.width;
                        const h = info.face.height;
                        const xy = getFaceXY(f, face.pos, w, h);
                        const y = xy.y + @divFloor(h, 2);
                        face.fire.attemptFire(&face.bullets, cd, xy.x, y, w);
                    },
                    .TIMEOUT => { face.fire.tick(); }
                }
            }

            // update player bullets
            var remBulls = CappedArrayList(usize, Player.max_bullets).init();
            for(player.bullets.toSlice()) |*bull, idx| {
                bull.y -= BulletInfo.speed;
                if(bull.y < -100) {
                    _ = player.bullets.swapRemove(idx);
                }
                const bull_x_end = bull.x + info.player.bullet.width;
                const bull_y_end = bull.y + info.player.bullet.height;

                for(face.states) |*fs, i| {
                    if(fs.* != .ALIVE) continue;
                    const xy = getFaceXY(i,
                                         face.pos,
                                         info.face.width,
                                         info.face.height);
                    const face_x_end = xy.x + info.face.width;
                    const face_y_end = xy.y + info.face.height;
                    const collided = !(xy.x > bull_x_end or
                                           face_x_end < bull.x or
                                           xy.y > bull_y_end or
                                           face_y_end < bull.y);
                    if(collided) {
                        fs.* = .DEAD;
                        face.dead_count += 1;
                        _ = player.bullets.swapRemove(idx);
                    }
                }
                for(face.bullets.toSlice()) |*fb, i| {
                    const bx_end = fb.x + info.face.bullet.width;
                    const by_end = fb.y + info.face.bullet.height;
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
            for(remBulls.toSlice()) |bi, i| {
                _ = player.bullets.orderedRemove(bi - i);
            }

            // update face bullets
            for(face.bullets.toSlice()) |*bull, idx| {
                bull.y += BulletInfo.speed;
                if(bull.y > Window.height + 100)
                    _ = face.bullets.swapRemove(idx);
                const xy = PosXY{ .x = player.pos, .y = info.player.y };
                const player_x_end = xy.x + info.player.width;
                const player_y_end = xy.y + info.player.height;
                const bull_x_end = bull.x + info.player.bullet.width;
                const bull_y_end = bull.y + info.player.bullet.height;
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
                resetGame(state, info);
                player.fire.state = .TIMEOUT;
            }
        }
    }

    // update debug
    if(ray.IsKeyPressed(ray.KEY_D)) {
        debug_drawing = !debug_drawing;
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

fn resetGame(s: *GameState, info: *const Info)
void {
    @memset(@ptrCast([*]u8, s), 0, @sizeOf(GameState));
    s.player.pos = info.player.starting_pos;
}
