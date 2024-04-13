const std = @import("std");
const print = std.debug.print;

pub fn isArmstrongNumber(num: u128) bool {
    const allocator = std.heap.page_allocator;
    const str = std.fmt.allocPrint(allocator, "{d}", .{num}) catch "Failed to format";

    var sum: u128 = 0;
    for (str) |c| {
        const digit: u8 = std.fmt.charToDigit(c, 10) catch 0;
        sum += std.math.pow(u128, digit, @as(u128, str.len));
    }

    return num == sum;
}
