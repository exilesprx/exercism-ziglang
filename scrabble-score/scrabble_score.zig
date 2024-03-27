const std = @import("std");
const Letters = struct { letters: []const u8, points: u8 };

const ones = Letters{ .letters = "AEIOULNRST", .points = 1 };
const twos = Letters{ .letters = "DG", .points = 2 };
const threes = Letters{ .letters = "BCMP", .points = 3 };
const fours = Letters{ .letters = "FHVWY", .points = 4 };
const fives = Letters{ .letters = "K", .points = 5 };
const eights = Letters{ .letters = "JX", .points = 8 };
const tens = Letters{ .letters = "QZ", .points = 10 };

pub fn score(s: []const u8) u32 {
    var sum: u32 = 0;
    const letters = [_]Letters{ ones, twos, threes, fours, fives, eights, tens };
    for (s) |c| {
        for (letters) |l| {
            if (contains(l.letters, c)) {
                sum += l.points;
            }
        }
    }

    return sum;
}

fn contains(letters: []const u8, letter: u8) bool {
    for (letters) |l| {
        if (std.ascii.isAlphabetic(letter) and std.ascii.toUpper(letter) == l) {
            return true;
        }
    }
    return false;
}
