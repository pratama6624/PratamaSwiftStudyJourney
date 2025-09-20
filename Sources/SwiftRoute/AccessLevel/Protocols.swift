import Foundation

public protocol PaymentMethod {
    func pay(amount: Double) -> Bool
}

// import SDK

struct CreditCard: PaymentMethod {
    public func pay(amount: Double) -> Bool {
        print("Paying \(amount) using credit card")
        return true
    }
}