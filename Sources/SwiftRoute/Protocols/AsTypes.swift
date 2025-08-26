protocol PaymentMethod {
    var name: String { get }
    func pay(amount: Double)
}

// Implementation
struct CreditCard: PaymentMethod {
    let name = "Credit Card"
    func pay(amount: Double) {
        print("Paid \(amount) using Credit Card")
    }
}

struct OVO: PaymentMethod {
    let name = "OVO Wallet"
    func pay(amount: Double) {
        print("Paid \(amount) using OVO")
    }
}

struct BankTransfer: PaymentMethod {
    let name = "Bank Transfer"
    func pay(amount: Double) {
        print("Paid \(amount) using Bank Transfer")
    }
}

// How to use
// Protocol as Types
let methods: [PaymentMethod] = [CreditCard(), OVO(), BankTransfer()]

func checkout(amount: Double, method: PaymentMethod) {
    print("Processing payment of \(amount) with \(method.name)")
    method.pay(amount: amount)
}

// Testing
checkout(amount: 100_000, method: OVO())
checkout(amount: 200_000, method: BankTransfer())