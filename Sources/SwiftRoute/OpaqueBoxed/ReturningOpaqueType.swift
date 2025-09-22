import Foundation

// MARK: - Basic Protocol
protocol Shape {
    func draw() -> String
}

// MARK: - Basic Shape
struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        (1...size)
            .map { String(repeating: "*", count: $0) }
            .joined(separator: "\n")
    }
}

struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        return Array(repeating: line, count: size)
            .joined(separator: "\n")
    }
}

// MARK: - Wrapper
struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        top.draw() + "\n" + bottom.draw()
    }
}

// MARK: - Public function with opaque type
// Flip and join
func flip<T: Shape>(_ shape: T) -> some Shape {
    FlippedShape(shape: shape)
}

func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
    JoinedShape(top: top, bottom: bottom)
}

// Custom Trapezoid
func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = flip(top)
    return join(top, join(middle, bottom))
}

// MARK: - Sample, How to use it
let smallTriangle = Triangle(size: 3)
print("Small Triangle:\n\(smallTriangle.draw())\n")

let flippedTriangle = flip(smallTriangle)
print("Flipped Triangle:\n\(flippedTriangle.draw())\n")

let joinedTriangles = join(smallTriangle, flippedTriangle)
print("Joined Triangles:\n\(joinedTriangles.draw())\n")

let trapezoid = makeTrapezoid()
print("Trapezoid:\n\(trapezoid.draw())")