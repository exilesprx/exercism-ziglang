const std = @import("std");

pub const Coordinate = struct {
    x: f32,
    y: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate{ .x = x_coord, .y = y_coord };
    }
    pub fn score(self: Coordinate) usize {
        const radius: f32 = std.math.sqrt(std.math.pow(f32, self.x, 2) + std.math.pow(f32, self.y, 2));
        if (radius <= 1.0) {
            return 10;
        }
        if (radius <= 5.0) {
            return 5;
        }

        if (radius <= 10.0) {
            return 1;
        }
        return 0;
    }
};
