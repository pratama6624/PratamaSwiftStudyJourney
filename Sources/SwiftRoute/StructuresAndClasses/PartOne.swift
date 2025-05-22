import Foundation

// Definition Syntax
// Structure
struct SomeStructure {
    // Code here
}
struct Resolution {
    var width = 0
    var height = 0
}
// Class
class SomeClass {
    // Code here
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// Structure and Class Instances
// Structure Instance
let someResolution = Resolution()
// Class Instance
let someVideoMode = VideoMode()

// Accessing Properties
// Structure
print("The width of someResolution is \(someResolution.width)")
// Class
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

// Memberwise Initializers for Structure Types
let vga = Resolution(width: 640, height: 480)
print("VGA resolution width is \(vga.width) and height \(vga.height)")

// Structures and Enumerations Are Value Types
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")
// On enum
enum CompassPoint {
    case north, east, west, south
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()
print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")

// Classes Are Reference Types
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
// References type like class
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

// Identity Operators
// Identical to (===)
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// Not identical to (!==)
if tenEighty !== alsoTenEighty {
    print("This command will not be printed")
}

// Pointers
// SWIFT IS SAFE, SO DON'T WORRY ABOUT MEMORY