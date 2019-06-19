const std = @import("std");
const Builder = std.build.Builder;
const builtin = @import("builtin");

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    // const windows = b.option(bool, "windows", "create windows build") orelse false;

    // {
    //     var t = b.addTest("test.zig");
    //     t.linkSystemLibrary("c");
    //     const test_step = b.step("test", "Run all tests");
    //     test_step.dependOn(&t.step);
    // }

    // var raycol = b.addStaticLibrary("raycolor", "raycolor.zig");

    {
        var exe = b.addExecutable("selfie-invaders", "selfie-invaders/main.zig");
        exe.setBuildMode(mode);
        exe.addIncludeDir("raylib/src");
        // exe.linkLibrary(raycol);
        exe.addPackagePath("ray", "ray.zig");

        // if (windows) {
        //     exe.setTarget(builtin.Arch.x86_64, builtin.Os.windows, builtin.Abi.gnu);
        // }

        // exe.addPackagePath("zang", "zang/src/zang.zig");
        const raylibFlags = [_][]const u8{"-std=c99",
                                         "-DPLATFORM=DESKTOP",
                                         "-DPLATFORM_DESKTOP",
                                         "-DGRAPHICS=GRAPHICS_API_OPENGL_33",
                                         "-D_GLFW_X11",
                                         "-D_DEFAULT_SOURCE",
                                         "-Iraylib/src",
                                         "-Iraylib/src/external/glfw/include",
                                         "-Iraylib/src/external/glfw/deps"};
        exe.addCSourceFile("raylib/src/core.c", raylibFlags);
        exe.addCSourceFile("raylib/src/models.c", raylibFlags);
        exe.addCSourceFile("raylib/src/raudio.c", raylibFlags);
        exe.addCSourceFile("raylib/src/rglfw.c", raylibFlags);
        exe.addCSourceFile("raylib/src/shapes.c", raylibFlags);
        exe.addCSourceFile("raylib/src/text.c", raylibFlags);
        exe.addCSourceFile("raylib/src/textures.c", raylibFlags);
        exe.addCSourceFile("raylib/src/utils.c", raylibFlags);
        
        exe.linkSystemLibrary("X11");
        exe.linkSystemLibrary("GL");
        exe.linkSystemLibrary("m");
        exe.linkSystemLibrary("pthread");
        exe.linkSystemLibrary("dl");
        exe.linkSystemLibrary("rt");
        exe.linkSystemLibrary("c");
        // const assets_path = std.fs.path.join(b.allocator, [][]const u8{b.build_root, "assets"});
        // exe.addBuildOption([]const u8, "assets_path", b.fmt("\"{}\"", assets_path));

        // exe.setOutputDir("zig-cache");

        b.default_step.dependOn(&exe.step);

        b.installArtifact(exe);

        const play = b.step("selfie", "Play Selfie Invaders");
        const run = exe.run();
        play.dependOn(&run.step);
    }
}
