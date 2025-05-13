import Foundation

// Sets
var uniqueNames: Set<String> = ["Tama", "Rika", "Tama", "Rika"]
print("\(uniqueNames)")

// Hash Values for Set Types
struct Person: Hashable {
    let id: Int
    let name: String
}

let persons: Set<Person> = [
    Person(id: 1, name: "Tama"),
    Person(id: 1, name: "Tama"),
    Person(id: 2, name: "Tama"),
    Person(id: 3, name: "Nur")
]
print("person = \(persons.count) with \(persons)")

// Set Type Syntax
// long form = shorthand
let letters: Set<String> = ["a", "b", "c"]
print("letters = \(letters)")

// Creating and Initializing an Empty Set
var ages = Set<Int>()
if ages.isEmpty {
    print("ages is empty")
}
ages.insert(18)
ages.insert(20)
if !ages.isEmpty {
    print("Now ages is not empty but there is \(ages.count) with contents \(ages)")    
}

// Creating a Set with an Array Literal
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
print("favorite genres \(favoriteGenres)")
var favoriteColors: Set = ["Red", "Green", "Blue"]
print("favorite colors \(favoriteColors)")

// Accessing and Modifying a Set
// Access
print("favorite colors has \(favoriteColors.count) fill with \(favoriteColors)")
// Note : Set cannnot be changed, can only de deleted and added
// Adding
favoriteColors.insert("White")
print("Now favorite color has \(favoriteColors.count) member fill with \(favoriteColors)")
// Remove
favoriteColors.remove("White")
print("Now favorite color is \(favoriteColors)")

// Iterating Over a Set
// Default
print("--------------------------------")
for favoriteColor in favoriteColors {
    print("\(favoriteColor)")
}
print("--------------------------------")
// With sort
for favoriteColor in favoriteColors.sorted() {
    print("\(favoriteColor)")
}
print("--------------------------------")

// Performing Set Operations
// Fundamental Set Operations