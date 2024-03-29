const std = @import("std");
const print = std.debug.print;

pub fn isPangram(str: []const u8) bool {
    var alphabet: [26]u8 = undefined;
    var uniqueChars: usize = 0;
    var i: usize = 0;
    for (str) |c| {
        if (std.ascii.isAlphabetic(c) and !contains(&alphabet, c)) {
            alphabet[i] = c;
            i += 1;
            uniqueChars += 1;
        }
    }

    return uniqueChars == alphabet.len;
}

fn contains(s: *[26]u8, c: u8) bool {
    for (s) |x| {
        if (!std.ascii.isAlphabetic(x)) {
            continue;
        }
        if (std.ascii.toLower(x) == std.ascii.toLower(c)) {
            return true;
        }
    }
    return false;
}
