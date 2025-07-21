// Deinitialization

// How Deinitialization Works
// deinit {
    // Code here
// }

// Deinitializers in Action
class Bank {
    static var coinsInBank = 10_000
    
    static func distributeCoins(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

// Player Class
class Player {
    var coinsInPurse: Int
    
    init(coins: Int) {
        coinsInPurse = Bank.distributeCoins(coins: coins)
    }
    
    func win(coins: Int) {
        coinsInPurse += Bank.distributeCoins(coins: coins)
    }
    
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 250)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins in the bacnk")

var playerTwo: Player? = Player(coins: 500)
print("A new player has joined the game with \(playerTwo!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins in the bacnk")

playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins& now has \(playerOne!.coinsInPurse) coins")
print("THe bank is now only has \(Bank.coinsInBank) coins left")

playerOne = nil
playerTwo = nil
print("PlayerOne has left the game")
print("PlayerTwo has left the game")
print("The bank now has \(Bank.coinsInBank)")