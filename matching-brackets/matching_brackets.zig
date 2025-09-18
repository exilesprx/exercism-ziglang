const std = @import("std");
const mem = std.mem;

pub fn isBalanced(allocator: mem.Allocator, s: []const u8) !bool {
    var array = try std.ArrayList(u8).initCapacity(allocator, s.len);
    defer array.deinit(allocator);

    for (s) |c| {
        switch (c) {
            '[', '(', '{' => {
                try array.append(allocator, c);
            },
            ']', ')', '}' => {
                // If the last element in the array is not the matching opening bracket, then we have a mismatch.
                const last = array.getLastOrNull();
                if (last != opening(c)) {
                    return false;
                }
                _ = array.pop();
            },

            else => {
                continue;
            },
        }
    }

    // If the array is empty, then all brackets were balanced.
    return array.items.len == 0;
}

fn opening(c: u8) u8 {
    switch (c) {
        ']' => return '[',
        ')' => return '(',
        '}' => return '{',
        else => unreachable,
    }
}
