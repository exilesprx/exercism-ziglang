const std = @import("std");
const mem = std.mem;

/// Returns the set of strings in `candidates` that are anagrams of `word`.
/// Caller owns the returned memory.
pub fn detectAnagrams(
    allocator: mem.Allocator,
    word: []const u8,
    candidates: []const []const u8,
) !std.BufSet {
    var bufset = std.BufSet.init(allocator);
    const wordSorted = try allocator.dupe(u8, word);
    defer allocator.free(wordSorted);
    const candidateSorted = try allocator.alloc(u8, word.len);
    defer allocator.free(candidateSorted);

    _ = std.ascii.lowerString(wordSorted, word);
    mem.sort(u8, wordSorted, {}, comptime std.sort.asc(u8));
    for (candidates) |candidate| {
        if (candidate.len != word.len or std.ascii.eqlIgnoreCase(word, candidate)) {
            continue;
        }

        _ = std.ascii.lowerString(candidateSorted, candidate);
        mem.sort(u8, candidateSorted, {}, comptime std.sort.asc(u8));
        if (!mem.eql(u8, wordSorted, candidateSorted)) {
            continue;
        }

        try bufset.insert(candidate);
    }
    return bufset;
}
