const std = @import("std");
const mem = std.mem;

pub fn transform(allocator: mem.Allocator, legacy: std.AutoHashMap(i5, []const u8)) mem.Allocator.Error!std.AutoHashMap(u8, i5) {
    var map = std.AutoHashMap(u8, i5).init(allocator);
    try map.ensureTotalCapacity(legacy.capacity());

    var items = legacy.iterator();
    while (items.next()) |item| {
        const values = item.value_ptr.*;
        for (values) |value| {
            try map.put(std.ascii.toLower(value), item.key_ptr.*);
        }
    }

    return map;
}
