import Foundation

// Inferring Type From Context
// Note : Swift will automatically know the data type of the parameter
let names = ["Bayu", "Andi", "Citra", "Dian"]
let reversedNames = names.sorted(by: { p1, p2 in return p1 > p2 })
print("Reversed names \(reversedNames)")

// Implicit Returns from
let numbers = [2, 6, 1, 9, 7, 5, 6]
let sortedNumber = numbers.sorted(by: { p1, p2 in p1 > p2 })
print("Sorted number \(sortedNumber)")

// Shorthand Argument Names
let members = [7, 1, 5, 2, 9, 3, 6]
let sortedMember = members.sorted(by: { $0 > $1 })
print("Sorted member \(sortedMember)")

// Operator Methods
// >

// Trailing Closures
let player = ["Pratama", "Yena", "Yuji", "Nur", "Young", "Anna"]
let sortedPlayer = player.sorted { $0 > $1 }
print("Sorted player \(sortedPlayer)")

// Capturing Values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func increment() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return increment
}

var counterA = makeIncrementer(forIncrement: 3)
print("Counter A : \(counterA())")
print("Counter A : \(counterA())")
print("Counter A : \(counterA())")

// Closures Are Reference Types
let counterB = makeIncrementer(forIncrement: 2)
let counterC = counterB
print("Counter B : \(counterB())") // Leading to the same closure
print("Counter C : \(counterC())") // Leading to the same closure
print("Counter B : \(counterB())") // Leading to the same closure

// Escaping Closures
