// Please implement the `ComputationError.IllegalArgument` error.
pub const ComputationError = error{
    IllegalArgument,
};

pub fn steps(number: usize) anyerror!usize {
    if (number == 0) {
        return ComputationError.IllegalArgument;
    }

    var num: usize = number;
    var i: usize = 0;
    while (num != 1) {
        if (num % 2 == 0) {
            num /= 2;
            i += 1;
            continue;
        }

        num = 3 * num + 1;
        i += 1;
    }
    return i;
}
