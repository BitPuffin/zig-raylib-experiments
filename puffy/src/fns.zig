
const std = @import("std");
pub fn debugLog(comptime fmt: []const u8, args: ...) void {
    const builtin = @import("builtin");

    if(builtin.mode == .Debug) {
        std.debug.warn(fmt, args);
    } else {
        @compileError("dbgEcho is only allowed to be used in debug builds");
    }
}

pub fn initZeroed(comptime T: type)
T {
    var v: T = undefined;
    @memset(@ptrCast([*]u8, &v), 0, @sizeOf(T));
    return v;
}
