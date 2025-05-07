import Foundation

// Assignment
let a = 10
var b = 5
b = a

let (c, d) = (1, 2)

print("a = \(a), b = \(b)")
print("c = \(c), d = \(d)")

// Arithmetic
// + -
var e = 20
var f = 10
var g = e + f - e

print("\(e) + \(f) - \(e) = \(g)")

// * /
var h = 2
var i = 4
var j = h * i / h // 4

print("\(h) x \(i) : \(h) = \(j)")

// String
let firstname = "Kukuh"
let middlename = "Nur"
let lastname = "Pratama"

let fullname = firstname + " " + middlename + " " + lastname

print("Fullname is \(fullname)")

// Remainder or Modulus in indonesian
var k = 10 % 7 // 3
print("10 % 7 = \(k)")

// Unary Minus
let l = 3
let m = -l
let n = -m

print("From \(l) to \(m) to \(n)")

// Unary Plus
let o = -10
let p = +o

print("From \(o) to \(p)")
