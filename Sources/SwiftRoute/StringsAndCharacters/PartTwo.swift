import Foundation

// Working with Characters
for character in "Never Give Up" {
    print(character, terminator: "")
}
print("\nDone\n--------------------------------------")

let exclamationMark = "!"
print("! = \(exclamationMark)")

let cat: [Character] = ["C", "a", "t"]
let stringOfCat: String = String(cat)
print("\(stringOfCat)\n--------------------------------------")

// Concatenating Strings and Characters
let firstname: String = "Kukuh"
let middlename: String = " Nur"
let lastname: String = " Pratama"
var fullname: String = firstname + middlename + lastname
let point: Character = "."
fullname.append(point)
print("\(fullname)\n--------------------------------------")

let badStart: String = """
One
Two
"""
let end: String = """
Three
"""
print("\(badStart + end)\n--------------------------------------")

let goodStart: String = """
One
Two

"""
print("\(goodStart + end)\n--------------------------------------")

// String Interpolation
let multiplier: Int = 3
let message: String = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print("\(message)\n--------------------------------------")

print(#"Write an interpolated string in Swift using \(multiplier)."#)
print(#"Dokumentasi rumus dengan swift x = \(a * b)"#)
print(#"6 times 7 is \#(6 * 7)"#)
print("--------------------------------------")

// Unicode
// Unicode Scalar Values
let duck: Character = "\u{1F425}"
print("Duck -> \(duck)")
// Extended Grapheme Clusters
let eAcute: Character = "\u{E9}" // é
let combinedEAcute: Character = "\u{65}\u{301}" // e followed by´
print("eAcute is \(eAcute), Combined eAcute is \(combinedEAcute)")
let precomposed: Character = "\u{D55C}" // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}" // ᄒ, ᅡ, ᆫ
print("Precomposed is \(precomposed), Decomposed is \(decomposed)")




