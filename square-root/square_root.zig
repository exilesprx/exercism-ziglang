const std = @import("std");

pub fn squareRoot(radicand: usize) usize {
    var i: u64 = 1;
    while (i * i < radicand) : (i = i + 1) {}
    return i;
}
