const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    var rna = try std.ArrayList(u8).initCapacity(allocator, dna.len);

    for (dna) |nucleotide| {
        switch (nucleotide) {
            'G' => {
                try rna.append(allocator, 'C');
            },
            'C' => {
                try rna.append(allocator, 'G');
            },
            'T' => {
                try rna.append(allocator, 'A');
            },
            'A' => {
                try rna.append(allocator, 'U');
            },
            else => unreachable,
        }
    }

    return rna.toOwnedSlice(allocator);
}
