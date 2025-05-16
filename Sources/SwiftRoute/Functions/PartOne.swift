import Foundation

// Functions
// Defining and Calling Functions
// Defining
func greet(person: String) -> String {
    let greeting = "Hello, \(person)!"
    return greeting
}
// Calling
print(greet(person: "Anna"))
func greetAgain(person: String) -> String {
    return "Hello again, \(person)!"
}
print(greetAgain(person: "Vita"))

// Function Parameters and Return Values
// Functions Without Parameters
func sayHai() -> String {
    return "Hai..."
}
print("\(sayHai())")
// Functions With Multiple Parameters
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))
print(greet(person: "Dita", alreadyGreeted: false))

// Functions Without Return Values
func greetMore(person: String) -> Void {
    print("Hello, \(person)!")
}
greetMore(person: "Dave")

// Functions with Multiple Return Values
func minAndMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minAndMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")