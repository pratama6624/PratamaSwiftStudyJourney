protocol TextRepresentable {
    var textualDescription: String { get }
}

struct Dice: TextRepresentable {
    var numberOfSides: Int

    var textualDescription: String {
        return "A \(numberOfSides)-sided dice"
    }
}

let d6 = Dice(numberOfSides: 6)
let d12 = Dice(numberOfSides: 12)

extension Array: TextRepresentable where Element:
TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

let myDice = [d6, d12]
print(myDice.textualDescription)

// Sample 2
print("")

struct Fruit: TextRepresentable {
    var name: String

    var textualDescription: String {
        return "This is \(name)"
    }
}

let apple = Fruit(name: "Apple")
let banana = Fruit(name: "Banana")

let cart = [apple, banana]
print(cart.textualDescription)

