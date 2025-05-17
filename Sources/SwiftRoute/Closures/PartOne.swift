import Foundation

// Closures
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
var mathfunc: (Int, Int) -> Int = addTwoInts
// Call
print("Result 3 + 5 = \(mathfunc(3, 5))")
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
mathfunc = multiplyTwoInts
print("Result 3 x 4 = \(mathfunc(3, 4))")
func sayHai(_ name: String) -> String {
    return "Hay, \(name)"
}
var greet: (String) -> String = sayHai
print("\(greet("Pratama"))")
// greet = addTwoInts // Error
// print("greet \(greet(1, 2))") // Error
// Sample 1
func makeCounter() -> () -> Int {
    var count = 0
    let counter = {
        count += 1
        return count
    }
    return counter
}
var counterA = makeCounter()
print("Counter A now is \(counterA())")
print("Counter A now is \(counterA())")
print("Counter A now is \(counterA())")
var counterB = makeCounter()
print("Counter B now is \(counterB())")
print("Counter B now is \(counterB())")
print("Counter B now is \(counterB())")

print("---------------------------------------")


// The Sorted Method
// Sample 1 (Easy Level)
let names: [String] = ["Hanna", "Ali", "Joe", "Pratama"]
// Full Closure Expression
let reversedFullClosure = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
print("Names sort is \(reversedFullClosure)\n---------------------------------------")
// Type Inference
let reversedTypeInference = names.sorted(by: { s1, s2 in
    return s1 > s2
})
print("Names sort is \(reversedTypeInference)\n---------------------------------------")
// Implicit Return
let reversedImplicitReturn = names.sorted(by: { s1, s2 in s1 > s2 })
print("Names sort is \(reversedImplicitReturn)\n---------------------------------------")
// Shorthand Argument Names
let reversedShorthandArgumentNames = names.sorted(by: { $0 > $1 })
print("Names sort is \(reversedShorthandArgumentNames)\n---------------------------------------")
// Trailing Closure Syntax
let reversedTrailing = names.sorted { $0 > $1 }
print("Names sort is \(reversedTrailing)\n---------------------------------------")

// Sample 2 (Easy Level)
let numbers: [Int] = [5, 7, 2, 1, 4, 9, 12, 3]
// Full Closure Expression
let reversedFullClosureNumbers = numbers.sorted(by: { (a: Int, b: Int) -> Bool in
    return a < b
})
print("Numbers sort is \(reversedFullClosureNumbers)\n---------------------------------------")
// Type Inference
let reversedTypeInferenceNumbers = numbers.sorted(by: { a, b in
    return a > b
})
print("Numbers sort is \(reversedTypeInferenceNumbers)\n---------------------------------------")
// Implicit Return
let reversedImplicitReturnNumbers = numbers.sorted(by: { a, b in a < b})
print("Numbers sort is \(reversedImplicitReturnNumbers)\n---------------------------------------")
// Shorthand Argument Names
let reversedShorthandArgumentNamesNumbers = numbers.sorted(by: { $0 > $1})
print("Numbers sort is \(reversedShorthandArgumentNamesNumbers)\n---------------------------------------")
// Trailing Closure Syntax
let reversedTrailingNumbers = numbers.sorted { $0 < $1}
print("Numbers sort is \(reversedTrailingNumbers)\n---------------------------------------")

// Sample 3 (Medium Level)
let numberTransformation = numbers.map { "Angka: \($0)" }
print("\(numberTransformation)")