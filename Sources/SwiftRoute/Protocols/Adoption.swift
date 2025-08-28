protocol TextRepresentable {
    var textualDescription: String { get }
}

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}

extension Hamster: TextRepresentable {}

let simonTheHamster = Hamster(name: "Simon")
// let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(simonTheHamster.textualDescription)

// Sample 2
protocol CustomStringConvertible {
    var description: String { get }
}

struct User {
    var username: String
    var email: String

    var description: String {
        return "User: \(username), Email: \(email)"
    }
}

extension User: CustomStringConvertible {}

let u1 = User(username: "Pratama", email: "pratama@gmail.com")
print(u1)
