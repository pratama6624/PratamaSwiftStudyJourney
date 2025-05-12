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


