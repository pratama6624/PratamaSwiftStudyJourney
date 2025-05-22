import Foundation

// Enumeration Syntax
enum SomeEnumeration {
    // Code goes here
}
enum CompassPoint {
    case north
    case south
    case east
    case west
}
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
// Initialization
var directionToHead = CompassPoint.north
// Call
print("\(directionToHead)")
// Change Value
directionToHead = .west
print("\(directionToHead)")

// Matching Enumeration Values with a Switch Statement
directionToHead = .south
switch directionToHead {
    case .north:
    print("Now heading north")
    case .south:
    print("Now heading south")
    case .east:
    print("Now heading east")
    case .west:
    print("Now heading west")
}
let somePlanet = Planet.earth
switch somePlanet {
    case .earth:
    print("Mostly harmless")
    default:
    print("Not a safe place for human")
}

// Iterating over Enumeration Cases
enum Beverage: CaseIterable {
    case coffe, tea, juice
}
// Counting
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// Iterable
for beverage in Beverage.allCases {
    print("Beverage: \(beverage)")
}

// Associated Values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
switch productBarcode {
    case .upc(let numberSystem, let manufacture, let product, let check):
    print("UPC: \(numberSystem) \(manufacture) \(product) \(check)")
    case .qrCode(let productCode):
    print("QR Code \(productCode)")
}
// or you can do this
productBarcode = .qrCode("FAFGKGAKWEIGFKEWU")
switch productBarcode {
    case let .upc(numberSystem, manufacture, product, check):
    print("UPC : \(numberSystem), \(manufacture), \(product), \(check).")
    case let .qrCode(productCode):
    print("QR code: \(productCode).")
}

// Raw Values
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// Implicitly Assigned Raw Values
enum AnotherPlanet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
enum AnotherCompassPoint: String {
    case north, east, west, south
}
let earthOrder = AnotherPlanet.earth.rawValue
print("Raw value of earch is \(earthOrder)")
let sunsetDirection = AnotherCompassPoint.west.rawValue
print("Sunset direction is \(sunsetDirection)")

// Initializing from a Raw Value
let possiblePlanet = AnotherPlanet(rawValue: 7) // Optional
print("Planet raw value 7 is \(possiblePlanet ?? .uranus)")

let positionToFind = 11
if let somePlanet = AnotherPlanet(rawValue: positionToFind) {
    switch somePlanet {
        case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

// Recursive Enumerations
print("-----------------------------------------------------------")
/* 
    In this section, because it is technical,
    It must be understood and use case studiesfor practice,
    OK bro
*/
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
// indirect enum ArithmeticExpression {
//     case number(Int)
//     case addition(ArithmeticExpression, ArithmeticExpression)
//     case multiplication(ArithmeticExpression, ArithmeticExpression)
// }
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
// print("5 + 4 = \(sum)")
// print("\(sum) * 2 = \(product)")
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
        case let .number(value):
            return value
        case let .addition(left, right):
            return evaluate(left) + evaluate(right)
        case let .multiplication(left, right):
            return evaluate(left) * evaluate(right)
    }
}
print("Evaluate sum of 5 + 4 = \(evaluate(sum))")
print("Evaluate multiply of 9 x 2 = \(evaluate(product))")