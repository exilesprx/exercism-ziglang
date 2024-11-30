const std = @import("std");

pub fn primes(buffer: []u32, comptime limit: u32) []u32 {
    var numbers = [_]bool{true} ** (limit + 1);
    if (limit < 2) {
        return buffer[0..0];
    }

    var primeCount: u8 = 0;
    for (numbers[2..], 2..) |number, n| {
        if (number == true) {
            buffer[primeCount] = @as(u32, @intCast(n));
            primeCount = primeCount + 1;
        }

        for (2..limit) |i| {
            const p = i * n;
            if (p > limit) {
                break;
            }
            numbers[p] = false;
        }
    }

    return buffer[0..primeCount];
}
