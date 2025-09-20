import Foundation

// Internal Module
internal protocol FraudCheck {
    func runFraudCheck() -> Bool
}

public struct CreditCard {
    public let number: String
    public let name: String

    public init(number: String, name: String) {
        self.number = number
        self.name = name
    }
}

// Conformance to internal protocol
extension CreditCard: FraudCheck {
    internal func runFraudCheck() -> Bool {
        // Logic fraud check internal
        return number.hasPrefix("4111")
    }
}