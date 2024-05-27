pub const ColorBand = enum { black, brown, red, orange, yellow, green, blue, violet, grey, white };

pub fn colorCode(colors: [2]ColorBand) usize {
    var output: usize = 0;
    for (colors, 0..) |color, i| {
        var value: usize = @intFromEnum(color);
        if (i == 0) {
            value *= 10;
        }
        output += value;
    }

    return output;
}
