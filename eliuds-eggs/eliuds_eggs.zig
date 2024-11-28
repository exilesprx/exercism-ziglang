const std = @import("std");

pub fn eggCount(number: usize) usize {
    var num: usize = number;
    var count: u8 = 0;
    while (num > 0) {
        if (num & 1 == 1) {
            count = count + 1;
        }
        num >>= 1;
    }
    return count;
}
