func swapTwoValues<T>(_ a: inout T, _ b: inout T) { 
    let temp = a
    a = b
    b = temp
}

struct Player {
    var name: String
    var score: Int
}

var player1 = Player(name: "Alice", score: 10)
var player2 = Player(name: "Bob", score: 20)

swapTwoValues(&player1, &player2)

print("Player1: \(player1.name), score: \(player1.score)")
print("Player2: \(player2.name), score: \(player2.score)")
// Player1: Bob, score: 20
// Player2: Alice, score: 10