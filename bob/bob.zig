const std = @import("std");

pub fn response(s: []const u8) []const u8 {
    const phrase = std.mem.trim(u8, s, &std.ascii.whitespace);
    if (phrase.len == 0) {
        return "Fine. Be that way!";
    }

    const is_question = phrase[phrase.len - 1] == '?';
    const is_yelling = isAllCaps(phrase);

    if (is_question and is_yelling) {
        return "Calm down, I know what I'm doing!";
    } else if (is_question) {
        return "Sure.";
    } else if (is_yelling) {
        return "Whoa, chill out!";
    }

    return "Whatever.";
}

fn isAllCaps(s: []const u8) bool {
    var is_all_caps = false;
    for (s) |c| {
        switch (c) {
            'a'...'z' => return false,
            'A'...'Z' => is_all_caps = true,
            else => continue,
        }
    }

    return is_all_caps;
}
