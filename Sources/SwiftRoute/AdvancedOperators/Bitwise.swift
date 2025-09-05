let a: UInt8 = 0b00111100 // 60
let b: UInt8 = 0b00001101 // 13

// AND
/*
    0b      0   0   1   1   1   1   0   0
    0b      0   0   0   0   1   1   0   1
    0b      0   0   0   0   1   1   0   0
*/
let andResult = a & b
let c = 0b00001100
print(c == andResult ? "60 & 13 = \(andResult)" : "Wrong")

// OR
/*
    0b      0   0   1   1   1   1   0   0
    0b      0   0   0   0   1   1   0   1
    0b      0   0   1   1   1   1   0   1
*/
let orResult = a | b
let d = 0b00111101
print(d == orResult ? "60 | 13 = \(orResult)" : "Wrong")

// XOR
/*
    0b      0   0   1   1   1   1   0   0
    0b      0   0   0   0   1   1   0   1
    0b      0   0   1   1   0   0   0   1
*/
let xorResult = a ^ b
let e = 0b00110001
print(e == xorResult ? "60 ^ 13 = \(xorResult)" : "Wrong")

// NOT
/*
    0b      0   0   1   1   1   1   0   0
    0b      1   1   0   0   0   0   1   1
*/
let notResult = ~a
let f = 0b11000011
print(f == notResult ? "~60 = \(notResult)" : "Wrong")

// Shift Left
/*
    0b      0   0   1   1   1   1   0   0   <- 2x
    0b      1   1   1   1   0   0   0   0
*/
let shiftLeft = a << 2
let g = 0b11110000
print(g == shiftLeft ? "60 << 2 = \(shiftLeft)" : "Wrong")

// Shift Right
/*
    0b      0   0   1   1   1   1   0   0   -> 1x
    0b      0   0   0   1   1   1   1   0
*/
let shiftRight = a >> 1
let h = 0b00011110
print(h == shiftRight ? "60 >> 1 = \(shiftRight)" : "Wrong")