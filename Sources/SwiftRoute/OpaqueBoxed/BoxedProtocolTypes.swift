import Foundation

protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    func draw() -> String { "▲" }
}

struct Square: Shape {
    func draw() -> String { "■" }
}

// Can be mixed
struct VerticalShapes: Shape {
    var shapes: [any Shape]
    func draw() -> String {
        shapes.map { $0.draw() }.joined(separator: "\n")
    }
}

// How to use it
let shapes = VerticalShapes(shapes: [Triangle(), Square(), Triangle()])
print(shapes.draw())