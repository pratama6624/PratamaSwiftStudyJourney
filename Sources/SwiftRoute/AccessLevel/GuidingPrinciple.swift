// Public variable with private type
private struct SecretData {}
// public var data = SecretData() // Error


// Function return types are more limited
fileprivate struct Hidden {}
// Error
// public func makeHidden() -> Hidden {
//     return Hidden()
// }

// Function parameters with lower access
private class Engine {}
// Error
// public func start(engine: Engine) {
//     print("Engine started")
// }


// Correct version
public struct Car {
    public var brand: String
    
    public init(brand: String) {
        self.brand = brand
    }
}
// ✅ Aman
public func makeCar() -> Car {
    return Car(brand: "Tesla")
}