const std = @import("std");

pub fn isValid(s: []const u8) bool {
    var sum: usize = 0;
    var digitCount: usize = 0;
    var i: usize = s.len;
    while (i > 0) : (i -= 1) {
        switch (s[i - 1]) {
            '0'...'9' => {
                digitCount += 1;
                const digit: u8 = std.fmt.charToDigit(s[i - 1], 10) catch unreachable;
                if (digitCount % 2 != 0) {
                    sum += digit;
                    continue;
                }

                const val: usize = digit * 2;
                if (val > 9) {
                    sum += val - 9;
                    continue;
                }
                sum += val;
            },
            ' ' => continue,
            else => return false,
        }
    }

    return digitCount > 1 and sum % 10 == 0;
}
