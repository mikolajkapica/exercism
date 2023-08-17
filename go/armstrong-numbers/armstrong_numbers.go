package armstrong

import (
    "math"
)

func IsNumber(n int) bool {
    // get the digits of the number
    digits := func(n int) []int {
        var digits []int
        for n > 0 {
            digits = append(digits, n % 10)
            n /= 10
        }
        return digits
    }(n)

    // add digits to the power of the number of digits
    var sum int = 0
    for _, digit := range digits {
        sum += int(math.Pow(float64(digit), float64(len(digits))))
    }

    return sum == n
}

