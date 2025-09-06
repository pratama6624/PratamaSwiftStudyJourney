// Apple Sample Vector 2D
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector1 = Vector2D(x: 2.0, y: 3.0)
let vector2 = Vector2D(x: 4.0, y: 5.0)
let result = vector1 + vector2
print(result) // Vector2D(x: 6.0, y: 8.0)

// Sample 2
import CoreGraphics

struct Point {
    var x: CGFloat
    var y: CGFloat
}

// Overload
extension Point {
    // Overload +
    static func + (lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    // Overload -
    static func - (lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}

let playerPos = Point(x: 100, y: 200)
let movement = Point(x: 20, y: -50)

let newPos = playerPos + movement
print(newPos) // Point(x: 120.0, y: 150.0)