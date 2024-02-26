pub fn squareOfSum(number: usize) usize {
    var sum: u32 = 0;
    var i: u32 = 1;
    while (i <= number) : (i += 1) {
        sum += i;
    }

    return sum * sum;
}

pub fn sumOfSquares(number: usize) usize {
    var sum: u32 = 0;
    var i: u32 = 1;
    while (i <= number) : (i += 1) {
        sum += i * i;
    }

    return sum;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}
