const std = @import("std");
const mem = std.mem;

pub fn rotate(allocator: mem.Allocator, text: []const u8, shiftKey: u5) mem.Allocator.Error![]u8 {
    const cipher: []u8 = try allocator.alloc(u8, text.len);
    for (text, 0..) |c, i| {
        if (c >= 'a' and c <= 'z') {
            cipher[i] = (((c - 'a') + shiftKey) % 26) + 'a';
            continue;
        }
        if (c >= 'A' and c <= 'Z') {
            cipher[i] = (((c - 'A') + shiftKey) % 26) + 'A';
            continue;
        }
        cipher[i] = c;
    }
    return cipher;
}
