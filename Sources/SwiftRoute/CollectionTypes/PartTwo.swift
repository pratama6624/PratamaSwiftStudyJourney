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
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
let houseAnimals2: Set = ["🐶", "🐱"]
let houseAnimals3: Set = ["🐱", "🐶"]
// is equal (==)
print("houseAnimals = houseAnimals2 is \(houseAnimals == houseAnimals2)")
print("houseAnimals = cityAnimals is \(houseAnimals == cityAnimals)")
print("houseAnimals2 = houseAnimals3 is \(houseAnimals2 == houseAnimals3)")
// isSubset
print("houseAnimals isSubset farmAnimals is \(houseAnimals.isSubset(of: farmAnimals))")
print("cityAnimals isSubset farmAnimals is \(cityAnimals.isSubset(of: farmAnimals))")
print("farmAnimals isSubset houseAnimals3 is \(farmAnimals.isSubset(of: houseAnimals3))")
// isSuperset
print("houseAnimals isSuperset farmAnimals is \(houseAnimals.isSuperset(of: farmAnimals))")
print("farmAnimals isSuperset houseAnimals is \(farmAnimals.isSuperset(of: houseAnimals))")
// isStrictSubset
let smallSet: Set = [1, 2]
let bigSet: Set = [1, 2, 3, 4]
let smallSet2: Set = [1, 2]
let mediumSet: Set = [5, 6, 7]
print("smallSet is isStrictSubset bigSet is \(smallSet.isStrictSubset(of: bigSet))")
print("smallSet is smallSet2 bigSet is \(smallSet.isStrictSubset(of: smallSet2))")
// isStrictSuperset
print("bigSet is isStrictSuperset smallSet is \(bigSet.isStrictSuperset(of: smallSet))")
print("smallSet2 is isStrictSuperset smallSet is \(smallSet2.isStrictSuperset(of: smallSet))")
// isDisjoint
print("smallSet is isDisjoint mediumSet is \(smallSet.isDisjoint(with: mediumSet))\n------------------------------------------")


// Dictionaries
var students: Dictionary<String, Int> = [
    "Pratama": 22,
    "Nur": 24,
    "Kukuh": 25
]
print("\(students)")

// Dictionary Type Shorthand Syntax
// long form
var data1: Dictionary<String, Int> = [
    "Pramata": 2,
    "Nur": 5
]
// shorthand
var data2: [String: Int] = [
    "Kukuh": 4,
    "Pratama": 10
]
// Creating an Empty Dictionary
var data3: [String: String] = [:]
if data3.isEmpty {
    print("data 3 is empty")
}
data3["Kukuh Nur Pratama"] = "411222054"
print("now data 3 is no longer empty")

// Creating a Dictionary with a Dictionary Literal
var mahasiswa: [String: String] = ["Pratama": "411222054", "Diki": "411222055"]
print("Mahasiswa \(mahasiswa)")

// Accessing and Modifying a Dictionary
// Access
if let nimPratama = mahasiswa["Pratama"] {
    print("Mahasiswa Pratama with NIM \(nimPratama)")
} else {
    print("Data NIM not found")
}
// Adding
mahasiswa["Nur"] = "411222055"
if let nimNur = mahasiswa["Nur"] {
    print("Mahasiswa Nur with NIM \(nimNur)")
} else {
    print("Data NIM not found")
}
// Modify
mahasiswa["Nur"] = "411222053"
if let newNimNur = mahasiswa["Nur"] {
    print("Mahasiswa Nur with new NIM \(newNimNur)")
} else {
    print("Data NIM not found")
}
// Remove / Delete
mahasiswa["Nur"] = nil
print("Final data mahasiswa \(mahasiswa)\n------------------------------------------")


// Iterating Over a Dictionary
// Default Iteration
for (name, nim) in mahasiswa {
    print("Mahasiswa \(name) with NIM \(nim)")
}
print("------------------------------------------")
// Get the key
for mahasiswaName in mahasiswa.keys {
    print("Mahasiswa with name \(mahasiswaName)")
}
print("------------------------------------------")
// Get the value
for mahasiswaNim in mahasiswa.values {
    print("Mahasiswa with NIM \(mahasiswaNim)")
}
print("------------------------------------------")
let names = [String](mahasiswa.keys)
print("\(names)\n------------------------------------------")
let nims = [String](mahasiswa.values)
print("\(nims)\n------------------------------------------")

