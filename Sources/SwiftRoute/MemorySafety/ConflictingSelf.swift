import Foundation

struct Player {
    var name: String
    var health: Int
    var energy: Int

    static let maxHealth = 10

    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)

// Is safe -> Different Memory Location
oscar.shareHealth(with: &maria)

// Error conflict -> In the same memory location
// oscar.shareHealth(with: &oscar)

// Solution
var copyOfOscar = oscar
oscar.shareHealth(with: &copyOfOscar)