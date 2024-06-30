const std = @import("std");
const mem = std.mem;

pub fn isBalanced(allocator: mem.Allocator, s: []const u8) !bool {
    var array = std.ArrayList(u8).init(allocator);
    defer array.deinit();

    for (s) |c| {
        switch (c) {
            '[', '(', '{' => {
                try array.append(c);
            },
            ']', ')', '}' => {
                if (array.items.len == 0) {
                    return false;
                }

                // If the last element in the array is not the matching opening bracket, then we have a mismatch.
                const last = array.getLast();
                if ((c == ']' and last != '[') or (c == ')' and last != '(') or (c == '}' and last != '{')) {
                    return false;
                }
                _ = array.popOrNull();
            },

            else => {
                continue;
            },
        }
    }

    // If the array is empty, then all brackets were balanced.
    return array.items.len == 0;
}
