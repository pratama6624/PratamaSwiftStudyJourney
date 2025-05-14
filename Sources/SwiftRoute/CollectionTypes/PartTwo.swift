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
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
// intersection
// just for that same
print("odd digits intersection with evendigits \(oddDigits.intersection(evenDigits).sorted())")
print("odd digits intersection  with single digit prime number \(oddDigits.intersection(singleDigitPrimeNumbers).sorted())")
// symmetric difference
// if there are 2 sets then the values that are not the same will be taken
print("odd digits symmetric difference with evendigits \(oddDigits.symmetricDifference(evenDigits).sorted())")
print("odd digits symmetric difference  with single digit prime number \(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())")
// union
// is the same as combining 2 sets
print("odd digits union with even digits \(oddDigits.union(evenDigits).sorted())")
// subtrating
// find the value that is not in both sets and display it but only from 1 side, namely the 1st set (odd digits)
print("odd subtrating with single digit prime number \(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())")


// Lom kelar broo, lanjutin tar sore
// Set Membership and Equality
// s equal (==)
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]