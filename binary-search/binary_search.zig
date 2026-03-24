const std = @import("std");

pub fn binarySearch(comptime t: type, target: usize, items: []const usize) ?usize {
    var set = [_]t{0} ** items.len;
    _ = target;
    std.debug.print("set: {any}\n", .{set});
    @compileError("please implement the binarySearch function");
}
