const std = @import("std");
const print = std.debug.print;

pub const DnaError = error{ EmptyDnaStrands, UnequalDnaStrands };

pub fn compute(first: []const u8, second: []const u8) DnaError!usize {
    if (first.len == 0 or second.len == 0) {
        return DnaError.EmptyDnaStrands;
    }

    if (first.len != second.len) {
        return DnaError.UnequalDnaStrands;
    }

    var hamming: usize = 0;
    for (first, 0..) |c, i| {
        if (c != second[i]) {
            hamming += 1;
        }
    }

    return hamming;
}
