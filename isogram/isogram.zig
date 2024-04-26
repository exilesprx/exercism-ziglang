const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    // std.mem.zeroes([26]u8) is another way to initialize the array
    var letters: [26]u8 = [_]u8{0} ** 26;
    for (str) |c| {
        if (!std.ascii.isAlphabetic(c)) {
            continue;
        }

        letters[std.ascii.toLower(c) - 'a'] += 1;

        if (letters[std.ascii.toLower(c) - 'a'] > 1) {
            return false;
        }
    }

    return true;
}
