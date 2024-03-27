const std = @import("std");

const LetterValues = struct {
    letters: []const u8,
    value: u8,

    pub fn contains(self: LetterValues, letter: u8) bool {
        for (self.letters) |l| {
            if (std.ascii.isAlphabetic(letter) and std.ascii.toUpper(letter) == l) {
                return true;
            }
        }
        return false;
    }
};

const ones = LetterValues{ .letters = "AEIOULNRST", .value = 1 };
const twos = LetterValues{ .letters = "DG", .value = 2 };
const threes = LetterValues{ .letters = "BCMP", .value = 3 };
const fours = LetterValues{ .letters = "FHVWY", .value = 4 };
const fives = LetterValues{ .letters = "K", .value = 5 };
const eights = LetterValues{ .letters = "JX", .value = 8 };
const tens = LetterValues{ .letters = "QZ", .value = 10 };
const letters = [_]LetterValues{ ones, twos, threes, fours, fives, eights, tens };

pub fn score(s: []const u8) u32 {
    var sum: u32 = 0;
    for (s) |c| {
        for (letters) |l| {
            if (l.contains(c)) {
                sum += l.value;
            }
        }
    }

    return sum;
}
