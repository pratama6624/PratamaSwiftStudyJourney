protocol Account {
    var id: String { get } // Just for read
    var balance: Double { get set } // Must be read and written

    static var systemName: String { get } // Type property
}

struct EWalletAccount: Account {
    var id: String
    var balance: Double

    static var systemName: String = "OVO"
}

class BankAccount: Account {
    var id: String
    var balance: Double
    
    static var systemName: String = "BCA"
    
    init(id: String, balance: Double) {
        self.id = id
        self.balance = balance
    }
}

// How to use
var ovo = EWalletAccount(id: "OVO-1234", balance: 200_000)
var bca = BankAccount(id: "BCA-5566", balance: 1_000_000)

print("User \(ovo.id) pakai \(EWalletAccount.systemName) dengan saldo \(ovo.balance)")
print("Topup berhasil! Saldo baru: \(ovo.balance)")

print("User \(bca.id) pakai \(BankAccount.systemName) dengan saldo \(bca.balance)")
bca.balance -= 250_000
print("Transfer berhasil! Saldo baru: \(bca.balance)")