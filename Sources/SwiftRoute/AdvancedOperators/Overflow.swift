// Basic Sample
var a:UInt8 = UInt8.max // 255
print(a &+ 1) // Muter balik ke bawah 0

var b = UInt8.min // 0
print(b &- 1) // Muter balik ke atas 255

var c: UInt8 = 200
print(c &* 2) // 144 (karena 200 * 2 = 400) tapi UInt8 max di 255 -> Muter


// Sample 2
struct RGBColor {
    var red: UInt8
    var green: UInt8
    var blue: UInt8

    mutating func brighten(by value: UInt8) {
        red = red &+ value
        green = green &+ value
        blue = blue &+ value
    }
}

var color = RGBColor(red: 250, green: 200, blue: 100)
color.brighten(by: 60)
print(color) 
// red   = 54 (karena 250+60=310 → overflow ke 54)
// green = 4
// blue  = 160