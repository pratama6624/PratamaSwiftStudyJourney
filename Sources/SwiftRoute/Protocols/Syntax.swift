protocol Payable {
    func processPayment(amount: Double)
}

protocol Refundable {
    func refund(amount: Double)
}

struct EWallet: Payable, Refundable {
    func processPayment(amount: Double) {
        print("Processing e-wallet payment of \(amount)")
    }
    
    func refund(amount: Double) {
        print("Refunding e-wallet payment of \(amount)")
    }
}

class PaymentSystem {
    var systemName: String
    init(systemName: String) {
        self.systemName = systemName
    }
}

class BankTransfer: PaymentSystem, Payable {
    func processPayment(amount: Double) {
        print("Processing bank transfer of \(amount) via \(systemName)")
    }
}

// How to use
let ovo = EWallet()
ovo.processPayment(amount: 200_000)
ovo.refund(amount: 50_000)

let bca = BankTransfer(systemName: "BCA")
bca.processPayment(amount: 1_000_000)