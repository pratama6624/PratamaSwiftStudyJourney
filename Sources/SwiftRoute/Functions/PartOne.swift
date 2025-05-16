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

// Optional Tuple Return Types
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
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
if let bounds = minMax(array: []) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

// Functions With an Implicit Return
func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}
print(greeting(for: "Dave"))
func anotherGreeting(for person: String) -> String {
    return "Hello, " + person + "!"
}
print(anotherGreeting(for: "Dave"))

// Function Argument Labels and Parameter Names
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // Code here
}

// Specifying Argument Labels
func someFunction(argumentLabel parameterName: Int) {
    // Code here
}
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))

// Omitting Argument Labels
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // Code here
}
someFunction(1, secondParameterName: 2)

// Default Parameter Values
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 10) {
    print("Pamameter 1 = \(parameterWithoutDefault), Parameter 2 = \(parameterWithDefault)")
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
someFunction(parameterWithoutDefault: 4)

// Variadic Parameters
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)

// In-Out Parameters
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    var temp = a
    a = b
    b = temp
}
var x = 5
var y = 10
swapTwoInts(&x, &y)
print("Now x = \(x) and y = \(y)")

// Function Types
// Function Types == Closures == Variable
func addTwoInt(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
// => (Int, Int) -> Int
func sayHello() {
    print("Hello")
}
// => () -> String

// Using Function Types
var mathFunction: (Int, Int) -> Int = addTwoInt
print("Result: \(mathFunction(2, 3))")
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")
// Function Types as Parameter Types
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) -> Void {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInt, 3, 5)
// Function Types as Return Types
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
print(moveNearerToZero)
print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

// Nested Functions
func chooseStepFunc(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentV = -4
let anotherMoveNearerToZero = chooseStepFunc(backward: currentV > 0)
while currentV != 0 {
    print("\(currentV)... ")
    currentV = anotherMoveNearerToZero(currentV)
}
print("zero!")