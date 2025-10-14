pub const HighScores = struct {
    highScores: []const i32 = &[_]i32{},
    best: i32 = 0,
    topThree: [3]i32 = [_]i32{0} ** 3,

    pub fn init(scores: []const i32) HighScores {
        var best: i32 = 0;
        var topThree: [3]i32 = [_]i32{0} ** 3;
        for (scores) |score| {
            if (score > best) {
                best = score;
            }

            if (score > topThree[0]) {
                topThree[2] = topThree[1];
                topThree[1] = topThree[0];
                topThree[0] = score;
            } else if (score > topThree[1]) {
                topThree[2] = topThree[1];
                topThree[1] = score;
            } else if (score > topThree[2]) {
                topThree[2] = score;
            }
        }
        return HighScores{ .highScores = scores, .best = best, .topThree = topThree };
    }

    pub fn latest(self: *const HighScores) ?i32 {
        if (self.highScores.len == 0) {
            return null;
        }
        return self.highScores[self.highScores.len - 1];
    }

    pub fn personalBest(self: *const HighScores) ?i32 {
        return self.best;
    }

    pub fn personalTopThree(self: *const HighScores) []const i32 {
        if (self.highScores.len == 0) {
            return &[_]i32{};
        }
        return self.topThree[0..@min(3, self.highScores.len)];
    }
};
