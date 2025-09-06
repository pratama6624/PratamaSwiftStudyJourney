// Basic Sample
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)

if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")  
    // Output: These two vectors are equivalent.
}

// Sample 2
struct Point: Equatable {
    var x: Int
    var y: Int
}

let p1 = Point(x: 5, y: 5)
let p2 = Point(x: 5, y: 5)

print(p1 == p2)  // true