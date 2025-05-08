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

// Nil-Coalescing
// Sample 1
var alterative = "Anonymous"
func getUserDisplayName(username: String?) -> String {
    return username != nil ? username! : alterative
}

let name1: String? = "Pratama"
let name2: String? = nil

print("Name 1 is \(getUserDisplayName(username: name1))")
print("Name 2 is \(getUserDisplayName(username: name2))")

// Sample 2
let defaultColorName: String = "red"
var userDefinedColorName: String? // Default is nil
var colorNameToUse = userDefinedColorName ?? defaultColorName

print("Color is \(colorNameToUse)")

userDefinedColorName = "green"
var colorNameToUse2 = userDefinedColorName ?? defaultColorName
print("Now the color changes to \(colorNameToUse2)")

// Range
// Closed range (...)
for index in 1...3 {
    print("\(index) times 3 is \(index * 3)")
    
}
// Half-Open Range (..<)
let names = ["Pratama", "Nur", "Alex", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// One-Sided Ranges
for name in names[2...] {
    print("One side right \(name)")
}
for name in names[...2] {
    print("One side left \(name)")
}
for name in names[..<2] {
    print("One side left less than 2 is \(name)")   
}

let range = ...5
print("Index 5 is \(range.contains(6))")
print("Index 5 is \(range.contains(5))")
print("Index 5 is \(range.contains(-15))")

// Logical
