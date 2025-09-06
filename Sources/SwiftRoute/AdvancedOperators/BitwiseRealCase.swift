struct Color {
    var value: UInt32

    // Extract channel use Shift + AND
    var alpha: UInt8 { UInt8((value >> 24) & 0xFF) }
    var red: UInt8 { UInt8((value >> 16) & 0xFF) }
    var green: UInt8 { UInt8((value >> 8) & 0xFF) }
    var blue: UInt8 { UInt8(value & 0xFF) }

    // Make new color from RGBA (With Shift + OR)
    static func fromRGBA(r: UInt8, g: UInt8, b: UInt8, a: UInt8 = 255) -> Color {
        let val = (UInt32(a) << 24) | (UInt32(r) << 16) | (UInt32(g) << 8) | UInt32(b)
        return Color(value: val)
    }

    // Invert color (with NOT)
    func inverted() -> Color {
        return Color(value: ~self.value)
    }

    // Toogle Red channel (with XOR)
    func toggleRed() -> Color {
        return Color(value: self.value ^ (0xFF << 16))
    }
}

// Make blue color
let blue = Color.fromRGBA(r: 0, g: 0, b: 255)
print("Blue: R\(blue.red) G\(blue.green) B\(blue.blue)")

// Invert
let invertedBlue = blue.inverted()
print("Inverted Blue: R\(invertedBlue.red) G\(invertedBlue.green) B\(invertedBlue.blue)")

// Toggle Red
let toggledRed = blue.toggleRed()
print("Toggle Red: R\(toggledRed.red) G\(toggledRed.green) B\(toggledRed.blue)")