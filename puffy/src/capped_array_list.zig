const std = @import("std");
const debug = std.debug;
const assert = debug.assert;

pub fn CappedArrayList(comptime T: type, comptime capacity: usize)
type {
    return struct {
        const Self = @This();

        items: [capacity]T,
        len: usize,

        pub fn init()
        Self {
            return Self {
                .len = 0,
                .items = undefined,
            };
        }

        pub fn toSlice(self: *Self)
        []T {
            return self.items[0..self.len];
        }

        pub fn toSliceConst(self: Self)
        []const T {
            return self.items[0..self.len];
        }

        pub fn at(self: Self, idx: usize)
        T {
            return self.toSliceConst()[idx];
        }

        pub fn setOrError(self: *Self, i: usize, item: T)
        !void {
            if(i > self.count()) return error.OutOfBounds;
            self.items[i] = item;
        }

        pub fn set(self: *Self, i: usize, item: T)
        void {
            assert(i < self.count());
            self.items[i] = item;
        }

        pub fn count(self: Self)
        usize {
            return self.len;
        }

        pub fn append(self: *Self, item: T)
        !void {
            const new = try self.addOne();
            new.* = item;
        }

        pub fn addOne(self: *Self)
        !*T {
            if(self.len == self.capacity()) return error.OutOfBounds;
            var i = &self.items[self.len];
            self.len += 1;
            return i;
        }

        pub fn capacity(self: Self)
        usize {
            return capacity;
        }

        pub fn swapRemove(self: *Self, i: usize)
        T {
            var item = self.pop();
            if(self.len == i) return item;
            self.toSlice()[i] = item;
            return item;
        }

        pub fn swapRemoveOrError(self: *Self, i: usize)
        !T {
            if(i >= self.len) return error.OutOfBounds;
            return self.swapRemove(i);
        }

        pub fn orderedRemove(self: *Self, i: usize)
        T {
            const item = self.at(i);
            var j = i;
            while(j < self.len) : (j += 1)
                self.items[j] = self.items[j+1];
            self.len -= 1;
            return item;
        }

        pub fn pop(self: *Self)
        T {
            self.len -= 1;
            return self.items[self.len];
        }
    };
}


const testing = std.testing;

test "CappedArrayList" {
    var l5 = CappedArrayList(i32, 5).init();

    testing.expect(l5.count() == 0);
    testing.expect(l5.capacity() == 5);

    var num = try l5.addOne();
    num.* = 2;
    testing.expect(l5.at(0) == 2);

    try l5.append(3);
    testing.expect(l5.at(1) == 3);
    testing.expect(l5.count() == 2);

    try l5.setOrError(0, 10);
    testing.expect(l5.at(0) == 10);

    l5.set(0, 20);
    testing.expect(l5.at(0) == 20);

    _ = l5.swapRemove(0);
    testing.expect(l5.at(0) == 3);
    testing.expect(l5.count() == 1);

    var n = try l5.swapRemoveOrError(0);
    testing.expect(n == 3);
    testing.expect(l5.count() == 0);

    try l5.append(1);
    try l5.append(2);
    try l5.append(3);
    try l5.append(4);
    _ = l5.orderedRemove(2);
    testing.expect(l5.at(2) == 4);
}
