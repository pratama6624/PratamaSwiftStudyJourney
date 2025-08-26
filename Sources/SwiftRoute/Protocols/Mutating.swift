// Sample From Apple Swift Official Documentation
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on

    mutating func toggle() {
        switch self {
            case .off:
                self = .on
            case .on:
                self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
lightSwitch.toggle()

print(lightSwitch == .on ? "is on" : "is off")

// Real Case Sample
protocol Account {
    var balance: Double { get set }
    mutating func deposit(amount: Double)
    mutating func withdraw(amount: Double)
}

struct SavingsAccount: Account {
    var balance: Double

    mutating func deposit(amount: Double) {
        balance += amount
        print("Deposited \(amount). New balance: \(balance)")
    }

    mutating func withdraw(amount: Double) {
        if amount <= balance {
            balance -= amount
            print("Withdrew \(amount). Remaining balance: \(balance)")
        } else {
            print("Insufficient funds. Balance: \(balance)")
        }
    }
}

// Example use
var myAccount = SavingsAccount(balance: 1000)
myAccount.deposit(amount: 200)   // ✅ balance -> 1200
myAccount.withdraw(amount: 500)  // ✅ balance -> 700
myAccount.withdraw(amount: 1_000) // ❌ Failed
myAccount.withdraw(amount: 500) // ✅ Success