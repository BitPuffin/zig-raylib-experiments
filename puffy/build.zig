const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const lib = b.addStaticLibrary("puffy", "src/puffy.zig");
    lib.setBuildMode(mode);

    var capped_array_list = b.addTest("src/capped_array_list.zig");
    capped_array_list.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&capped_array_list.step);

    b.default_step.dependOn(&lib.step);
    b.installArtifact(lib);
}
