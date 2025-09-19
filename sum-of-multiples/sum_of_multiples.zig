const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    var earnedEnergy = std.AutoHashMap(u64, void).init(allocator);
    defer earnedEnergy.deinit();

    for (factors) |factor| {
        if (factor == 0 or factor > limit) {
            continue;
        }

        var i = factor;
        while (i < limit) : (i += factor) {
            try earnedEnergy.put(i, {});
        }
    }

    var energyTotal: u64 = 0;
    var items = earnedEnergy.keyIterator();
    while (items.next()) |points| {
        energyTotal += points.*;
    }

    return energyTotal;
}
