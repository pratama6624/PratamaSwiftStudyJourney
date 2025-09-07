import Foundation

//// Sample Basic 1
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func += (left: inout Vector2D, right: inout Vector2D) {
        left = Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

// Custom Operator Declaration
prefix operator +++

// Implementation (doubling)
extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        var temp = vector
        vector += temp
        return vector
    }
}

// How to use
var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
print(afterDoubling) // (2.0, 8.0)


//// Real Case 1
/// Infix => Operator between two operands
infix operator ^^ : MultiplicationPrecedence
extension Int {
    static func ^^ (base: Int, power: Int) -> Int {
        return Int(pow(Double(base), Double(power)))
    }
}

// How to use
let hasil = 2 ^^ 3  // 8
print("2 ^^ 2 is \(hasil)")

//// Real Case 2
/// +-
infix operator +- : AdditionPrecedence

func +- (lhs: Int, rhs: Int) -> (Int, Int) {
    return (lhs + rhs, lhs - rhs)
}

// How to use
print("11 +- 4 is \(11 +- 4)")  // (15, 7)

//// Real Case 3
/// =>
infix operator => : AssignmentPrecedence

func => <K, V>(key: K, value: V) -> (K, V) {
    return (key, value)
}

// How to use
let dict = Dictionary(uniqueKeysWithValues: [
    "name" => "Pratama",
    "role" => "iOS Dev",
    "lang" => "Swift"
])
print(dict) 
// ["name": "Pratama", "role": "iOS Dev", "lang": "Swift"]

//// Real Case 4
/// >>>
infix operator >>> : MultiplicationPrecedence

func >>> <A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
    return { g(f($0)) }
}

// How to use
func x2(_ x: Int) -> Int { x * 2 }
func add3(_ x: Int) -> Int { x + 3 }

let operation = x2 >>> add3
print(operation(4)) // 11 (because (4 * 2) + 3)

//// Real Case 5
/// ~~
infix operator ~~ : ComparisonPrecedence

func ~~ (lhs: Double, rhs: Double) -> Bool {
    return abs(lhs - rhs) < 0.0001
}

// How to use
print("0.1 + 0.2 ~~ 0.3 is \(0.1 + 0.2 ~~ 0.3)")
print("0.1 + 0.3 ~~ 0.3 is \(0.1 + 0.3 ~~ 0.3)")
