protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Int: TextRepresentable {
    var textualDescription: String {
        return "This is \(self)"
    }
}

let number: TextRepresentable = 42
print(number.textualDescription)

struct User {
    let id: Int
    let name: String
}

extension User: TextRepresentable {
    var textualDescription: String {
        return "User \(id): \(name)"
    }
}

let u = User(id: 1, name: "Pratama")
print(u.textualDescription)
