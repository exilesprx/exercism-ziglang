pub const ColorBand = enum { black, brown, red, orange, yellow, green, blue, violet, grey, white };

pub fn colorCode(color: ColorBand) usize {
    return switch (color) {
        .black => 0,
        .brown => 1,
        .red => 2,
        .orange => 3,
        .yellow => 4,
        .green => 5,
        .blue => 6,
        .violet => 7,
        .grey => 8,
        .white => 9,
    };
}

pub fn colors() []const ColorBand {
    const c: [10]ColorBand = .{ ColorBand.black, ColorBand.brown, ColorBand.red, ColorBand.orange, ColorBand.yellow, ColorBand.green, ColorBand.blue, ColorBand.violet, ColorBand.grey, ColorBand.white };
    return &c;
}
