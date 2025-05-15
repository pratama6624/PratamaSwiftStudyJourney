import Foundation

// For-In Loops
let names: [String] = ["Nana", "Pratama", "Nur", "Kukuh"]
for name in names {
    print("Hello \(name)")
}
print("--------------------------------------------")
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, leg) in numberOfLegs {
    print("Animal \(animalName) with \(leg) legs")
}
print("--------------------------------------------")
for i in 1...3 {
    print("\(i) times 3 is \(i * 3)")
}
print("--------------------------------------------")
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)\n--------------------------------------------")
let minutes = 60
for _ in 1..<minutes {
    // render each tickmark here
}
let minuteInterval = 5
for _ in stride(from: 0, through: minutes, by: minuteInterval) {
    // render every 5 minute (0, 5, 10, 15, 20, ...., 50, 55)
}
let hours = 12
let hourInterval = 3
for _ in stride(from: 3, through: hours, by: hourInterval) {
    // render eveny 3 hours (3, 6, 9, 12)
}

// While Loop
// While
var countdown = 5
while countdown > 0 {
    print("countdown \(countdown)")
    countdown -= 1
}
// Repeat While
print("------------------------------------------")
var i = 1
repeat {
    print("i is \(i)")
    i += 1
} while i <= 5

// Conditional Statements
// If
print("------------------------------------------")
var temperatureInFahrenheit = 32
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")   
}
temperatureInFahrenheit = 40
if temperatureInFahrenheit < 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's to hot")   
}
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a T-shirt.")
}

// Switch
let someCharacter: Character = "z"
switch someCharacter {
    case "a":
    print("The first letter of the Latin alphabet")
    case "z":
    print("The last letter of the Latin alphabet")
    default:
    print("Some other character")
}
// No Implicit Fallthrough
let anotherCharacter: Character = "a"
switch anotherCharacter {
// case "a": // Invalid, the case has an empty body
case "a", "A":
    print("The letter A")
case "b", "B":
    print("The letter B")
default:
    print("Not the letter A or B")
}
// Interval Matching
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// Tuples
let somePoint: (Int, Int) = (1, 1)
switch somePoint {
    case (0, 0):
    print("\(somePoint) is at the origin")
    case (_, 0):
    print("\(somePoint) is on the x-axis")
    case (0, _):
    print("\(somePoint) is on the y-axis")
    case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
    default:
    print("\(somePoint) is outside of the box")
}
// Prints "(1, 1) is inside the box"