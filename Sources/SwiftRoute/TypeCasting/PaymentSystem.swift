import Foundation

// Base class
class Payment {
    var amount: Double

    init(amount: Double) {
        self.amount = amount
    }

    func processPayment() {
        print("Processing payment of \(amount)")
    }
}

// Subclasses
class CreaditCardPayment: Payment {
    var cardNumber: String

    init(amount: Double, cardNumber: String) {
        self.cardNumber = cardNumber
        super.init(amount: amount)
    }

    override func processPayment() {
        print("Processing Credit Card payment of \(amount) using card \(cardNumber)")
    }
}

class EWalletPayment: Payment {
    var walletId: String

    init(amount: Double, walletId: String) {
        self.walletId = walletId
        super.init(amount: amount)
    }

    override func processPayment() {
        print("Processing E-Wallet payment of \(amount) from wallet ID \(walletId)")
    }
}

class BankTransferPayment: Payment {
    var accountNumber: String

    init(amount: Double, accountNumber: String) {
        self.accountNumber = accountNumber
        super.init(amount: amount)
    }

    override func processPayment() {
        print("Processing Bank Transfer of \(amount) from account \(accountNumber)")
    }
}

// Simulasi list payment campur aduk
let payments: [Payment] = [
    CreaditCardPayment(amount: 200_000, cardNumber: "1234-5678-9876"),
    EWalletPayment(amount: 150_000, walletId: "OVO-9988"),
    BankTransferPayment(amount: 500_000, accountNumber: "1122334455")
]

// Loop dan lakukan type casting
for payment in payments {
    payment.processPayment()

    if let ccPayment = payment as? CreaditCardPayment {
        print("💳 Card khusus: \(ccPayment.cardNumber)")
    } else if let eWallet = payment as? EWalletPayment {
        print("📱 E-Wallet khusus: \(eWallet.walletId)")
    } else if let bank = payment as? BankTransferPayment {
        print("🏦 Bank account khusus: \(bank.accountNumber)")
    }
}
