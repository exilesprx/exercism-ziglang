const std = @import("std");
const assert = std.debug.assert;

pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

/// Asserts that `n` is nonzero.
pub fn classify(n: u64) Classification {
    assert(n != 0);

    var i: u64 = 1;
    var aliquot_sum: u128 = 0;
    while (i < n) : (i += 1) {
        if (n % i == 0) {
            aliquot_sum += i;
        }
    }

    if (n < aliquot_sum) {
        return Classification.abundant;
    } else if (n > aliquot_sum) {
        return Classification.deficient;
    }

    return Classification.perfect;
}
