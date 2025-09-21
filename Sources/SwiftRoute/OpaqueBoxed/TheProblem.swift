import Foundation

// MARK: - Protocol
protocol Shape {
    func draw() -> String
}

// MARK: - Implementations
struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result: [String] = []
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}

// MARK: - Wrapper Types (internal)
struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator:"\n")
        return lines.reversed().joined(separator: "\n")
    }
}

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U

    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}

// MARK: - Public API ( use opaque type )
func flip<T: Shape>(_ shape: T) -> some Shape {
    return FlippedShape(shape: shape)
}

func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
    return JoinedShape(top: top, bottom: bottom)
}

// MARK: - Usage
let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())

print("")

let flipped = flip(smallTriangle)
print(flipped.draw())

print("")

let joined = join(smallTriangle, flipped)
print(joined.draw())