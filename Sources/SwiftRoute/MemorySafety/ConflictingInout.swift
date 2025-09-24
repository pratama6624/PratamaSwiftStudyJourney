import Foundation

// Sample 1
var stepSize = 1

func increment(_ number: inout Int) {
    // Here we access stepSize (read)
    number += stepSize
}

// Error -> Conflict
// increment(&stepSize) // Error

// Here the solution
func correctIncrement(_ number: inout Int, by step: Int) {
    number += step
}

// Make copy first
var copyOfStepSize = stepSize
correctIncrement(&copyOfStepSize, by: stepSize)

// Update
stepSize = copyOfStepSize
print(stepSize) // 2


// Sample 2
func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

var playerOneScore = 42
var playerTwoScore = 30

// Is safe, different memory location
balance(&playerOneScore, &playerTwoScore)

// Is not safe, In the same memory location
balance(&playerOneScore, &playerOneScore)