protocol Shape {
    func area() -> Double
}

struct Square: Shape {
    var side: Double
    func area() -> Double { side * side }
}

struct Circle: Shape {
    var radius: Double
    func area() -> Double { .pi * radius * radius }
}

// Opaque Types
// Some

// Error -> Use shape only
// Use some Shape -> Opaque type
func makeAShape() -> some Shape {
    // We hide concrete type
    return Square(side: 5)
}

let s = makeAShape()
print(s.area())

// Boxed
// Any
func makeRandomShape() -> any Shape {
    return Bool.random() ? Square(side: 3) : Circle(radius: 2)
}

let randomShape = makeRandomShape()
print(randomShape.area())
