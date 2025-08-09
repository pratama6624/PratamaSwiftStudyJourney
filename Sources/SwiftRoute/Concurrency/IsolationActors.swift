import Foundation

// Isolation Actors
actor BankAccount {
    var balance = 0

    func deposit(_ amount: Int) {
        balance += amount
    }

    func getBalance() -> Int {
        return balance
    }
}

let account = BankAccount()

Task {
    await account.deposit(1000)
    print(await account.getBalance())  // Safe from data race condition
}