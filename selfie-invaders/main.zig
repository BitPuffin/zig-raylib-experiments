const std = @import("std");
const mem = std.mem;
const warn = std.debug.warn;

const ray = @import("ray");

const screen_width = 1280;
const screen_height = 960;

const face_count = 16;
const face_padding = 30;
const face_per_row = 8;
const face_speed = 8;

const max_bullets = 8;
const bullet_timeout = 0.3;
const max_face_bullets = 4;
const bullet_speed = 16;
const bullet_width = 10;
const bullet_height = 20;

const camera_speed = 16;
const camera_padding = face_padding;
const camera_hitbox_shrink_y = 20;
const camera_hitbox_shrink_x = 10;

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

const GameCondition = enum {
    PLAYING,
    WON,
    LOST,
};

const Fire = struct {
    state: FireState,
    timeout: f64,
};

const Player = struct {
    bullets: [max_bullets]Bullet,
    fire: Fire,
    pos: c_int,
};

const Face = struct {
    states: [face_count]FaceState,
    death_timeout: [face_count]f64,
    bullets: [max_face_bullets]Bullet,
    fire: Fire,
    pos: c_int,
    direction: c_int,
};

const GameState = struct {
    condition: GameCondition,
    player: Player,
    face: Face,
};

pub fn main() void {
    ray.InitWindow(screen_width, screen_height, c"Selfie Invaders");
    ray.SetTargetFPS(60);

    var camera_tex = ray.LoadTexture(c"selfie-invaders/camera.png");
    const player_y = screen_height - camera_tex.height - face_padding;
    const camera_max = screen_width - (camera_tex.width + screen_offset);
    const player_starting_pos = @divFloor((screen_width - camera_tex.width), 2);

    var state: GameState = undefined;
    resetGame(&state, player_starting_pos);
    var player = &state.player;
    var face = &state.face;

    var debug_drawing = false;

    const weary_face_tex = ray.LoadTexture(c"selfie-invaders/weary-face.png");
    const face_width = weary_face_tex.width;
    const face_height = weary_face_tex.height;
    const face_x_max = block: {
        var result: c_int = face_width + face_padding;
        result *= face_per_row;
        result += face_padding;
        result = screen_width - result;
        break :block result;
    };
    const face_collision_zone = block: {
        comptime var row_count = face_count / face_per_row;
        if(face_count % face_per_row != 0) row_count += 1;

        const face_and_padding = face_height + face_padding;
        const y = row_count * face_and_padding;
            
        break :block y;
    };
    const camera_collision_zone =
        screen_height
        - camera_tex.height
        - camera_padding
        + camera_hitbox_shrink_y;

    const fnt = ray.GetFontDefault();

    while (!ray.WindowShouldClose()) {
        {   // drawing
            ray.BeginDrawing();
            ray.ClearBackground(ray.RAYWHITE);

            // draw player
            ray.DrawTexture(camera_tex,
                            player.pos,
                            player_y,
                            ray.WHITE);
            
            {   // draw faces
                for(face.states) |s, idx| {
                    if(s == FaceState.ALIVE) {
                        const xy = getFaceXY(idx,
                                             face.pos,
                                             face_width,
                                             face_height);
                        ray.DrawTexture(
                            weary_face_tex,
                            xy.x, //face_pos + face_padding + xOffset,
                            xy.y,
                            ray.WHITE);
                    }
                }
            }

            {   // draw player bullets
                for(player.bullets) |bull| {
                    if (isBulletClear(bull)) break;
                    ray.DrawRectangle(bull.x,
                                      bull.y,
                                      bullet_width,
                                      bullet_height,
                                      ray.RED);
                }
            }

            switch(state.condition) {
                .PLAYING => {},
                .WON => {
                    ray.DrawText(c"Congratulations! (space for reset)",
                                 50,
                                 100,
                                 32,
                                 ray.BLACK);
                },
                .LOST => {}
            }

            if(debug_drawing) {
                ray.DrawFPS(100,0);
                ray.DrawLine(0,
                             face_collision_zone,
                             screen_width,
                             face_collision_zone,
                             ray.GREEN);
                ray.DrawLine(0,
                             camera_collision_zone,
                             screen_width,
                             camera_collision_zone,
                             ray.GREEN);
                ray.DrawRectangleLines(player.pos + camera_hitbox_shrink_x,
                                       player_y + camera_hitbox_shrink_y,
                                       camera_tex.width - camera_hitbox_shrink_x*2,
                                       camera_tex.height - camera_hitbox_shrink_x*2,
                                       ray.PURPLE);
                for(face.states) |s, idx| {
                    if(s == .ALIVE) {
                        const xy = getFaceXY(idx, face.pos, face_width, face_height);
                        ray.DrawRectangleLines(
                            xy.x, //(face_padding + face_width) * col,
                            xy.y,
                            face_width,
                            face_height,
                            ray.PURPLE);
                    }
                }
            }

            ray.EndDrawing();
        }

        {   // update
            // update player
            switch(state.condition ) {
                .PLAYING => {
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
                                const ac = countActiveBullets(player.bullets[0..]);
                                if(ac < max_bullets) {
                                    player.bullets[ac] = Bullet {
                                        .x = player.pos + @divFloor(camera_tex.width, 2),
                                        .y = screen_height - camera_tex.height,
                                    };
                                    player.fire.state = .TIMEOUT;
                                }
                            }
                        },
                        .TIMEOUT => {
                            player.fire.timeout += ray.GetFrameTime();
                            if (player.fire.timeout > bullet_timeout) {
                                player.fire.state = .READY;
                                player.fire.timeout = 0.0;
                            }
                        }
                    }
                },
                .WON, .LOST => {
                    if(ray.IsKeyPressed(ray.KEY_SPACE)) {
                        resetGame(&state, player_starting_pos);
                    }
                }
            }

            {  // update faces
                face.pos += face_speed * (1 - (2 * face.direction));

                if(face.direction == 0
                       and face.pos > face_x_max) {
                    face.direction = 1; // reverse
                    face.pos = face_x_max;
                } else if(face.direction == 1
                              and face.pos < 0) {
                    face.direction = 0;
                    face.pos = 0;
                }

                var lost = true;
                for(face.states) |s| {
                    if(s == .ALIVE) {
                        lost = false;
                        break;
                    }
                }
                if(lost) {
                    state.condition = .WON;
                }
            }

            {   // update player bullets
                for(player.bullets) |*bull, idx| {
                    if(isBulletClear(bull.*)) break;
                    bull.y -= bullet_speed;
                    if(bull.y < -100) {
                        freeBulletAt(player.bullets[0..], idx);
                    }
                    if(bull.y < face_collision_zone) {
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
                            const col_pred = !(
                                xy.x > bull_x_end or
                                face_x_end < bull.x or
                                xy.y > bull_y_end or
                                face_y_end < bull.y
                            );
                            if(col_pred) {
                                fs.* = .DYING;
                                freeBulletAt(player.bullets[0..], idx);
                            }
                        }
                    }
                }
            }

            {   // update debug
                if(ray.IsKeyPressed(ray.KEY_D)) {
                    debug_drawing = !debug_drawing;
                }
            }
        }
    }
}

const PosXY = struct { x: c_int, y: c_int };
fn getFaceXY(
    idx: usize,
    face_pos: c_int,
    tex_width: c_int,
    tex_height: c_int) PosXY
{
    var row: c_int = @intCast(c_int, idx / face_per_row);
    var row_idx = @intCast(c_int, idx % face_per_row);
    var col = row_idx + 1;
    const wfw = tex_width;
    const x = blk: {
        var mk_x = (face_padding + wfw) * row_idx;
            mk_x += face_padding;
        mk_x += face_pos;
        break :blk mk_x;
    };
    const y = face_padding + row * (tex_height + face_padding);
    return PosXY { .x = x, .y = y };
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

fn resetGame(s: *GameState, player_start: c_int) void {
    @memset(@ptrCast([*]u8, s), 0, @sizeOf(GameState));
    s.player.pos = player_start;
}
