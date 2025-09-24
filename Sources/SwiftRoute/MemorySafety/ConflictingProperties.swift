import Foundation

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

// Sample Error -> Tuple
var playerInfo = (health: 10, energy: 20)

// Error Sample -> Struct Global
struct Player {
    var name: String
    var health: Int
    var energy: Int
}

var holly = Player(name: "Holly", health: 10, energy: 10)

// Error Conflict
// balance(&holly.health, &holly.energy)

// Error Sample -> Struct Local
func someFunction() {
    var oscar = Player(name: "Oscar", health: 10, energy: 10)

    // Is safe
    balance(&oscar.health, &oscar.energy)
}