import Foundation

protocol Verifiable {
    func verify()
}

// Real Declaration
struct BankAccount {
    private var balance: Double = 0.0

    init(initialBalance: Double) {
        self.balance = initialBalance
    }

    private func logAccess() {
        print("Accessing private stuff")
    }
}

// Extension to add protocol conformance
extension BankAccount: Verifiable {
    func verify() {
        logAccess()
        print("Current balance: \(balance)")
    }
}

// Other extension in the same file
extension BankAccount {
    mutating func deposit(_ amount: Double) {
        balance += amount
    }
}