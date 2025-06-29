// Property Wrapper
// Setting Initial Values for Wrapped Properties
@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum)}
    }

    init() {
        maximum = 12
        number = 0
    }

    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }

    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

// use init()
struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}
var zeroRectangle = ZeroRectangle()
print("ZeroRectangle height: \(zeroRectangle.height), ZeroRectangle width: \(zeroRectangle.width)")
zeroRectangle.height = 2 // 2 - maximum is 12
zeroRectangle.width = 4 // 4 - maximum is 12
print("ZeroRectangle height: \(zeroRectangle.height), ZeroRectangle width: \(zeroRectangle.width)")

// use init(wrappedValue:)
struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}
var unitRectangle = UnitRectangle()
print("\nUnitRectangle height: \(unitRectangle.height), UnitRectangle width: \(unitRectangle.width)")
unitRectangle.height = 5 // 5 - maximum is 12
unitRectangle.width = 5 // 5 - maximum is 12
print("UnitRectangle height: \(unitRectangle.height), UnitRectangle width: \(unitRectangle.width)")

// use init(wrappedValue: , maximum)
struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 4) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 5) var width: Int
}
var narrowRectangle = NarrowRectangle()
print("\nNarrowRectangle height: \(narrowRectangle.height), NarrowRectangle width: \(narrowRectangle.width)")
narrowRectangle.height = 5 // 4 - maximum is 4
narrowRectangle.width = 5 // 5 - - maximum is 5
print("NarrowRectangle height: \(narrowRectangle.height), NarrowRectangle width: \(narrowRectangle.width)")

// use mixed init()
struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(wrappedValue: 2, maximum: 10) var width: Int
}
var mixedRectangle = MixedRectangle()
print("\nMixedRectangle height: \(mixedRectangle.height), MixedRectangle width: \(mixedRectangle.width)")
mixedRectangle.height = 5 // 5 - maximum is 12
mixedRectangle.width = 12 // 10 - maximum is 10
print("MixedRectangle height: \(mixedRectangle.height), MixedRectangle width: \(mixedRectangle.width)")