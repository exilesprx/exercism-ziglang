const std = @import("std");
const print = std.debug.print;

pub fn isArmstrongNumber(num: u128) bool {
    _ = num;
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    const buf = arena.allocator();
    const str: []const u128 = std.fmt.allocPrint(buf, "{d}", .{102});
    defer buf.free(str);

    print("str: {}\n", str);
}
