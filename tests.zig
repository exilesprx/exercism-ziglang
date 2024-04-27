const std = @import("std");

comptime {
    _ = @import("armstrong-numbers/test_armstrong_numbers.zig");
    _ = @import("collatz-conjecture/test_collatz_conjecture.zig");
    _ = @import("difference-of-squares/test_difference_of_squares.zig");
    _ = @import("isogram/test_isogram.zig");
    _ = @import("leap/test_leap.zig");
    _ = @import("pangram/test_pangram.zig");
    _ = @import("scrabble-score/test_scrabble_score.zig");
    _ = @import("hamming/test_hamming.zig");
}

test {
    std.testing.refAllDecls(@This());
}
