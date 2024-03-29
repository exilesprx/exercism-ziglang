const std = @import("std");
const print = std.debug.print;

pub fn isPangram(str: []const u8) bool {
    var alphabet: [26]u8 = undefined;
    var i: usize = 0;
    for (str) |c| {
        if (std.ascii.isAlphabetic(c)) {
            // fill the alphabet array with 1s if the letter is found
            // and the index is the letter's position in the alphabet
            alphabet[std.ascii.toLower(c) - 'a'] = 1; // c - a = 99 - 97 = 2
            i += 1;
        }
    }

    return foundAll(&alphabet);
}

fn foundAll(s: *[26]u8) bool {
    for (s) |x| {
        if (x != 1) {
            return false;
        }
    }
    return true;
}
