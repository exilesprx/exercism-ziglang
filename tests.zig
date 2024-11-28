const std = @import("std");

comptime {
    _ = @import("armstrong-numbers/test_armstrong_numbers.zig");
    _ = @import("bob/test_bob.zig");
    _ = @import("collatz-conjecture/test_collatz_conjecture.zig");
    _ = @import("darts/test_darts.zig");
    _ = @import("eliuds-eggs/eliuds_eggs.zig");
    _ = @import("difference-of-squares/test_difference_of_squares.zig");
    _ = @import("grains/test_grains.zig");
    _ = @import("hamming/test_hamming.zig");
    _ = @import("isbn-verifier/test_isbn_verifier.zig");
    _ = @import("isogram/test_isogram.zig");
    _ = @import("leap/test_leap.zig");
    _ = @import("luhn/test_luhn.zig");
    _ = @import("matching-brackets/test_matching_brackets.zig");
    _ = @import("nucleotide-count/test_nucleotide_count.zig");
    _ = @import("pangram/test_pangram.zig");
    _ = @import("perfect-numbers/test_perfect_numbers.zig");
    _ = @import("queen-attack/queen_attack.zig");
    _ = @import("resistor-color/test_resistor_color.zig");
    _ = @import("resistor-color-duo/test_resistor_color_duo.zig");
    _ = @import("scrabble-score/test_scrabble_score.zig");
    _ = @import("space-age/test_space_age.zig");
    _ = @import("triangle/test_triangle.zig");
}

test {
    std.testing.refAllDecls(@This());
}
