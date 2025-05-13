import Foundation

// Mutability of Collections
// Just let and var

// Arrays
// Array Type Shorthand Syntax
// long form
let names: Array<String> = ["Pratama", "Nur", "Kukuh"]
// shorthand
let animals: [String] = ["Dog", "Cat", "Snake"]

// Creating an Empty Array
var numbers: [Int] = []
var myNumbers = [Int]()
if numbers.isEmpty && myNumbers.isEmpty {
    print("They are empty")
}

// Creating an Array with a Default Value
var threeDoubles = Array(repeating: 0.0, count: 3)
print("\(threeDoubles)")

// Creating an Array by Adding Two Arrays Together
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
print("\(anotherThreeDoubles)")

var sixDoubles = threeDoubles + anotherThreeDoubles
print("\(sixDoubles)")

// Creating an Array with an Array Literal
var shoppingList: [String] = ["Eggs", "Milk"]
print("\(shoppingList)")

// Accessing and Modifying an Array
// Access
print("shopping list has \(shoppingList.count) fill with \(shoppingList[0]) and \(shoppingList[1])")
// Modify
shoppingList[0] = "Chichen"
print("Now the Egg turns into a \(shoppingList[0])")
// Adding
shoppingList.append("Flour")
print("\(shoppingList)")
shoppingList += ["Baking Powder"]
print("\(shoppingList)")
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
print("\(shoppingList)\n------------------------------")

// Iterating Over an Array
for item in shoppingList {
    print("\(item)")
}
print("------------------------------")
for (index, value) in shoppingList.enumerated() {
    print("\(index + 1) is \(value)")
}
print("------------------------------")