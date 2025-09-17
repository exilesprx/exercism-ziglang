const std = @import("std");

pub fn convert(buffer: []u8, n: u32) []const u8 {
    var pos: usize = 0;

    if (n % 3 == 0) {
        @memcpy(buffer[pos .. pos + 5], "Pling");
        pos += 5;
    }

    if (n % 5 == 0) {
        @memcpy(buffer[pos .. pos + 5], "Plang");
        pos += 5;
    }

    if (n % 7 == 0) {
        @memcpy(buffer[pos .. pos + 5], "Plong");
        pos += 5;
    }

    if (pos != 0) {
        return buffer[0..pos];
    }

    return std.fmt.bufPrint(buffer, "{}", .{n}) catch unreachable;
}
