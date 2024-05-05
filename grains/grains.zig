const std = @import("std");

pub const ChessboardError = error{IndexOutOfBounds};

pub fn square(index: usize) ChessboardError!u64 {
    if (index <= 0 or index >= 65) {
        return ChessboardError.IndexOutOfBounds;
    }

    var sum: u64 = 1;
    var i: u8 = 1;
    while (i < index) : (i += 1) {
        sum = sum * 2;
    }
    return sum;
}

pub fn total() u64 {
    var sum: u64 = 0;
    for (1..65) |i| {
        sum += square(i) catch 0;
    }
    return sum;
}
