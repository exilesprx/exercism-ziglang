const std = @import("std");

pub fn isValidIsbn10(s: []const u8) bool {
    var digits: usize = 0;
    var sum: usize = 0;
    for (s) |c| {
        if (c == '-') {
            continue;
        }

        if (std.ascii.isAlphabetic(c) and std.ascii.toUpper(c) != 'X') {
            return false;
        }

        var value: usize = undefined;
        if (std.ascii.toUpper(c) == 'X') {
            if (digits != 9) {
                return false;
            }

            value = 10;
        } else {
            value = std.fmt.charToDigit(c, 10) catch 0;
        }

        sum += value * (10 - digits);
        digits += 1;
    }

    return digits == 10 and sum % 11 == 0;
}
