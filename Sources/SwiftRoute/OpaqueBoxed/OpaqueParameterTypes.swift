import Foundation

protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    func draw() -> String {
        return "🔺"
    }
}

struct Square: Shape {
    func draw() -> String {
        return "⬛️"
    }
}

// Generic Version
func drawTwiceGeneric<SomeShape: Shape>(_ shape: SomeShape) -> String {
    let drawn = shape.draw()
    return drawn + " " + drawn
}

// 'some' Version
func drawTwiceSome(_ shape: some Shape) -> String {
    let drawn = shape.draw()
    return drawn + " " + drawn
}

// Use 2 parameters 'some Shape'
func combine(shape s1: some Shape, with s2: some Shape) -> String {
    return s1.draw() + " " + s2.draw()
}

// How to use it
let t = Triangle()
let s = Square()

print(drawTwiceGeneric(t)) // 🔺 🔺
print(drawTwiceSome(s))    // ⬛️ ⬛️
print(combine(shape: t, with: s)) // 🔺 ⬛️