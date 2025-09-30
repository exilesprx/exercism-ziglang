const std = @import("std");
const mem = std.mem;

fn lowerAndSort(buffer: []u8, word: []const u8) void {
    _ = std.ascii.lowerString(buffer, word);
    mem.sort(u8, buffer, {}, comptime std.sort.asc(u8));
}

/// Returns the set of strings in `candidates` that are anagrams of `word`.
/// Caller owns the returned memory.
pub fn detectAnagrams(
    allocator: mem.Allocator,
    word: []const u8,
    candidates: []const []const u8,
) !std.BufSet {
    var bufset = std.BufSet.init(allocator);
    errdefer bufset.deinit();
    const wordSorted = try allocator.dupe(u8, word);
    defer allocator.free(wordSorted);
    const candidateSorted = try allocator.alloc(u8, word.len);
    defer allocator.free(candidateSorted);

    lowerAndSort(wordSorted, word);
    for (candidates) |candidate| {
        if (candidate.len != word.len or std.ascii.eqlIgnoreCase(word, candidate)) {
            continue;
        }

        lowerAndSort(candidateSorted, candidate);
        if (!mem.eql(u8, wordSorted, candidateSorted)) {
            continue;
        }

        try bufset.insert(candidate);
    }
    return bufset;
}
