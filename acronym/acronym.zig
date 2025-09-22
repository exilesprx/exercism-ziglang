const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var acronym = try std.ArrayList(u8).initCapacity(allocator, words.len);
    var splitWords = mem.splitAny(u8, words, " -");

    while (splitWords.next()) |word| {
        if (word.len == 0) {
            continue;
        }

        for (word) |char| {
            switch (char) {
                'a'...'z', 'A'...'Z' => {
                    try acronym.append(allocator, std.ascii.toUpper(char));
                    break;
                },
                else => {
                    continue;
                },
            }
        }
    }
    return acronym.toOwnedSlice(allocator);
}
