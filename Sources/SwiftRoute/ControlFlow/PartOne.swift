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

// Value Bindings
let anotherPoint = (2, 0)
switch anotherPoint {
    case (let x, 0):
        print("on the x-axis with an x value of \(x)")
    case (0, let y):
        print("on the y-axis with a y value of \(y)")
    case let (x, y):
        print("somewhere else at (\(x), \(y))")
}

// Where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
    case let (x, y) where x == y:
        print("(\(x), \(y)) is on the line x == y")
    case let (x, y) where x == -y:
        print("(\(x), \(y)) is on the line x == -y")
    case let (x, y):
        print("(\(x), \(y)) is just some arbitrary point")
}

// Compound Cases
let someChar: Character = "v"
switch someChar {
    case "a", "i", "u", "e", "o":
        print("\(someChar) is a vowel")
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
        "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
        print("\(someChar) is a consonant")
    default:
        print("\(someChar) isn't a vowel or a consonant")       
}
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
    // This is the same as the function ||
    case (let distance, 0), (0, let distance):
        print("On an axis, \(distance) from the origin")
    default:
        print("Not on an axis")
}

// Control Transfer Statements
// Continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for char in puzzleInput {
    if charactersToRemove.contains(char) {
        continue
    }
    puzzleOutput.append(char)
}
print("\(puzzleOutput)\n----------------------------------")

// Break
// Break in a Loop Statement
for i in 1..<100 {
    if i == 3 {
        break
    }
    print("i = \(i)")
}

// Break in a Switch Statement
let number = 5
switch number {
case 5:
    print("5")
    // Break is only an option in swift
    break
case 6:
    print("6")
default:
    print("i don't know")
}

// Fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
    case 2, 3, 5, 7, 11, 13, 17, 19:
        description += " a prime number, and also"
        fallthrough
    default:
        description += " an integer."
}
print("\(description)")

let value = 3
switch value {
    case 3:
        print("This is 3")
        fallthrough
    case 4:
        print("This is 4")
        fallthrough
    case 5:
        print("This is 5")
    default:
        print("Done")
}

// Labeled Statements
print("\n--------------------------------------------")
outerLoop: for i in 1...5 {
    innerLoop: for j in 1...5 {
        if j == 3 {
            print("Break to outer loop i = \(i), j = \(j)")
            break outerLoop
        }
        print("i = \(i), j = \(j)")
    }
}
print("--------------------------------------------")
numberLoop: for num in 1...5 {
    if num % 2 == 0 {
        print("Next iteration from number loop in num = \(num)")
        continue numberLoop
    }
    print("Odd number: \(num)")
}

// Early Exit
print("--------------------------------------------")
func great(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }

    print("Hello \(name)")

    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location)")
}
great(person: ["name": "Pratama"])
great(person: ["name": "Nur", "location": "South tangerang"])

// Deferred Actions
print("--------------------------------------------")
var score = 1
if score < 10 {
    defer {
        print(score)
    }
    score += 5
}
print("--------------------------------------------")
var score2 = 3
if score2 < 100 {
    score2 += 100
    defer {
        score2 -= 100
    }
    print(score2)
}
print("--------------------------------------------")
if score < 10 {
    defer {
        print(score)
    }
    defer {
        print("The score is \(score)")
        
    }
    score += 5
}

// Checking API Availability
@available(macOS 10.12, *)
struct ColorPreference {
    var bestColor = "blue"
}
func chooseBestColor() -> String {
    guard #available(macOS 10.12, *) else {
       return "gray"
    }

    let colors = ColorPreference()
    return colors.bestColor
}
print(chooseBestColor())