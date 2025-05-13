import Foundation

// Accessing and Modifying a String
// String Indices
let name: String = "Kukuh Nur Pratama"
print("Character start is \(name[name.startIndex])")
print("Character after start is \(name[name.index(after: name.startIndex)])")
print("Character end is \(name[name.index(before: name.endIndex)])")

let index = name.index(name.startIndex, offsetBy: 6)
print("Character 6 is \(name[index])")

for index in name.indices {
    print("\(name[index])", terminator: "")
}
print("\nDone\n---------------------------------")

// Inserting and Removing
var welcome: String = "Hello"
welcome.insert("!", at: welcome.endIndex)
print("\(welcome)")
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
print("\(welcome)")

welcome.remove(at: welcome.index(before: welcome.endIndex))
print("\(welcome)")

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
print("\(welcome)")

// Substrings
let greeting: String = "Hello, world!"
let indexOf = greeting.firstIndex(of: ",") ?? greeting.endIndex
print("\(indexOf)")
let beginning = greeting[..<indexOf]
print("\(beginning)")
let newString = String(beginning)
print("\(newString)\n---------------------------------")

// Comparing Strings
// Equality (==)
// String and Character Equality
let a = "Dog"
let b = "Dog"
print("\(a) equals \(b) is \(a == b)")

let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("They are not the same")
}

// Prefix Equality => Stating with
let c = "Hello, world!"
print("\(c) it starts from \"Hello\" is \(c.hasPrefix("Hello"))")

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

// Suffix Equality => Ends with
let image = "profil.jpg"
print("\(image) ends with \".png\" is \(image.hasSuffix(".png"))")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes\n---------------------------------")

// Unicode Representations of Strings
// On Going
let bigA = "\u{0041}"
print(#"\(u{0041}) equals A"#)