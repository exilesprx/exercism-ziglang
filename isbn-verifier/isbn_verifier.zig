const std = @import("std");

pub fn isValidIsbn10(s: []const u8) bool {
    var digits: usize = 0;
    var sum: usize = 0;
    for (s) |c| {
        var value: usize = undefined;
        switch (c) {
            '-' => continue,
            'X' => if (digits == 9) {
                value = 10;
            } else return false,
            '0'...'9' => {
                value = std.fmt.charToDigit(c, 10) catch 0;
            },
            else => return false,
        }

        sum += value * (10 - digits);
        digits += 1;
    }

    return digits == 10 and sum % 11 == 0;
}
