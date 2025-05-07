import Foundation

// Compound Assignment
var a = 2
a += 2

print("Now a is \(a)")

// Comparison
// == != > < >= <=
var b = 1 == 1 // true
var c = 1 != 2 // true
var d = 1 > 2 // false
var e = 1 < 2 // true
var f = 1 >= 1 // true
var g = 1 <= 1 // true

print("1 == 1 is \(b)")
print("1 != 1 is \(c)")
print("1 > 2 is \(d)")
print("1 < 2 is \(e)")
print("1 >= 1 is \(f)")
print("1 <= 1 is \(g)")

// Ternary Conditional

var age = 20
var toWatch = (age >= 18) ? "Just carry on" : "No, you can't"

print(toWatch)


