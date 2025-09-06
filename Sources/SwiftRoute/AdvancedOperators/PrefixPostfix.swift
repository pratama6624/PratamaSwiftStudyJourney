// Sample Basic
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive // (-3.0, -4.0)
let backToPositive = -negative // (3.0, 4.0)

print("positive: \(positive)")
print("negative: \(negative)")
print("baack to positive: \(backToPositive)")