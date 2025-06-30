// Projecting a Value From a Property Wrapper
@propertyWrapper
struct SmallNumber {
    private var number: Int
    private(set) var projectedValue: Bool

    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }

    init() {
        self.number = 0
        self.projectedValue = false
    }
}

struct SomeStructure {
    @SmallNumber var someNumber: Int
}
var someStructure = SomeStructure()
someStructure.someNumber = 5
print("SomeStructure SomeNumber is \(someStructure.$someNumber)")
someStructure.someNumber = 60
print("SomeStructure SomeNumber is \(someStructure.$someNumber)")

// Clamped
@propertyWrapper
struct ClampedNumber {
    private var value: Int
    private(set) var projectedValue: Bool
    let max: Int

    var wrappedValue: Int {
        get { value }
        set {
            if newValue > max {
                value = max
                projectedValue = true
            } else {
                value = newValue
                projectedValue = false
            }
        }
    }

    init(wrappedValue initialValue: Int = 0, max: Int) {
        self.max = max
        self.projectedValue = false
        self.value = min(initialValue, max)
        if initialValue > max {
            self.projectedValue = true
        }
    }
}

enum Size {
    case small, large, ultra
}

struct SizedRectangle {
    @ClampedNumber(max: 500) var height: Int
    @ClampedNumber(max: 500) var width: Int

    mutating func resize(to size: Size) -> Bool {
        switch size {
            case .small:
                height = 10
                width = 20
            case .large:
                height = 100
                width = 200
            case .ultra:
                height = 500
                width = 1000
        }
        return $height || $width
    }
}

// to .small
print("\nTo small without clamped")
var sizedRectangle: SizedRectangle = SizedRectangle()
sizedRectangle.height = 10 // Max 100
sizedRectangle.width = 10 // Max 100
var wasClamped = sizedRectangle.resize(to: .small)
print("Height: \(sizedRectangle.height)") // 10
print("Width: \(sizedRectangle.width)") // 20
print("Was Clamped? \(wasClamped)") 

// to .large
print("\nTo large without clamped")
sizedRectangle.height = 10 // Max 100
sizedRectangle.width = 10 // Max 100
wasClamped = sizedRectangle.resize(to: .large)
print("Height: \(sizedRectangle.height)") // 100
print("Width: \(sizedRectangle.width)") // 100
print("Was Clamped? \(wasClamped)") 

// to .ultra
print("\nTo ultra with clamped")
sizedRectangle.height = 600 // Max 100
sizedRectangle.width = 1000 // Max 100
wasClamped = sizedRectangle.resize(to: .ultra)
print("Height: \(sizedRectangle.height)") // 100
print("Width: \(sizedRectangle.width)") // 100
print("Was Clamped? \(wasClamped)") 

// Global and Local Variables
func someFunction() {
    @SmallNumber var myNumber: Int

    myNumber = 10
    print("My Number is \(myNumber)")

    myNumber = 20
    print("My Number is \(myNumber)")
}

// Error
// myNumber = 10
// print("My Number is \(myNumber)")

someFunction()

// Type Properties
// Type Property Syntax
struct AnotherSomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

// Querying and Setting Type Properties
print(AnotherSomeStructure.storedTypeProperty)
// Prints "Some value."
AnotherSomeStructure.storedTypeProperty = "Another value."
print(AnotherSomeStructure.storedTypeProperty)
// Prints "Another value."
print(SomeEnumeration.computedTypeProperty)
// Prints "6"
print(SomeClass.computedTypeProperty)
// Prints "27"

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print("Left Channel : \(leftChannel.currentLevel)")
// Prints "7"
print("Max : \(AudioChannel.maxInputLevelForAllChannels)")
// Prints "7"

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
// Prints "10"
print(AudioChannel.maxInputLevelForAllChannels)
// Prints "10"