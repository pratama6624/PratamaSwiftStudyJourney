// Sample Basic
public class Car {
    private var engineNumber: String = "ABC123"
    fileprivate var fuelLevel: Int = 100
    internal var speed: Int = 0
    public var brand: String

    public init(brand: String) {
        self.brand = brand
    }

    private func startEngine() {
        print("Engine started!")
    }

    open func drive() {
        print("Driving at \(speed) km/h")
    }
}


// • engineNumber → can only be accessed within Car.
// • fuelLevel → can be accessed within the same file.
// • speed → can be accessed within the module (default).
// • brand → can be accessed from outside the module.
// • drive() → can be overridden by subclasses outside the module.