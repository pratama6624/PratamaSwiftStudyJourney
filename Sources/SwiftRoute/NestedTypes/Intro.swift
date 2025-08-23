struct BlackjackCard {

    // Nested enumeration
    enum Suit : Character {
        case spades = "♠"
        case hearts = "♥"
        case diamonds = "♦"
        case clubs = "♣"
    }

    // Nested enumeration
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace

        struct Values {
            let first: Int, second: Int?
        }

        var values: Values {
            switch self {
                case .ace:
                    return Values(first: 1, second: 11)
                case .jack, .queen, .king:
                    return Values(first: 10, second: nil)
                default: return Values(first: self.rawValue, second: nil)
            }
        }
    }

    // Properties
    let rank: Rank, suit: Suit

    var description: String {
        var output = "Suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

let card1 = BlackjackCard(rank: .ace, suit: .hearts)
print(card1.description)

let card2 = BlackjackCard(rank: .king, suit: .spades)
print(card2.description)