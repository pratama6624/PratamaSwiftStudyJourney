import Foundation

private struct SecretPIN {
    let value: String
}

public struct BankAccount {
    public let accountNumber: String

    // Secret -> private
    private let pin: SecretPIN

    public init(accountNumber: String, pinValue: String) {
        self.accountNumber = accountNumber
        self.pin = SecretPIN(value: pinValue)
    }

    public func verify(pinValue: String) -> Bool {
        return pin.value == pinValue
    }
}