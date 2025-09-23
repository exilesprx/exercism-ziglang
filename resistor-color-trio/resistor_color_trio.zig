const std = @import("std");
const mem = std.mem;

pub const ColorBand = enum { black, brown, red, orange, yellow, green, blue, violet, grey, white };

pub fn label(allocator: mem.Allocator, colors: []const ColorBand) mem.Allocator.Error![]u8 {
    const multiplier: usize = std.math.pow(usize, 10, @as(usize, @intFromEnum(colors[2])));
    const ohms: usize = (10 * @as(usize, @intFromEnum(colors[0])) + @as(usize, @intFromEnum(colors[1]))) * multiplier;

    if (ohms >= 1_000_000_000) {
        const gigaohms: f64 = @as(f64, @floatFromInt(ohms)) / 1_000_000_000;
        return try std.fmt.allocPrint(allocator, "{d} gigaohms", .{gigaohms});
    } else if (ohms >= 1_000_000) {
        const megaohms: f64 = @as(f64, @floatFromInt(ohms)) / 1_000_000;
        return try std.fmt.allocPrint(allocator, "{d} megaohms", .{megaohms});
    } else if (ohms >= 1_000) {
        const kiloohms: f64 = @as(f64, @floatFromInt(ohms)) / 1_000;
        return try std.fmt.allocPrint(allocator, "{d} kiloohms", .{kiloohms});
    } else {
        return try std.fmt.allocPrint(allocator, "{d} ohms", .{ohms});
    }
}
