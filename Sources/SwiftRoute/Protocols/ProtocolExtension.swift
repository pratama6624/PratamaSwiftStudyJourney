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

// Sample Basic
protocol Identifiable {
    var id: String { get }
}

extension Identifiable {
    func describe() {
        print("I am identifiable with id = \(id)")
    }
}

// MARK: - Conforming Types
struct UserStruct: Identifiable {
    var id: String
    var name: String
}

struct Product: Identifiable {
    var id: String
    var title: String
}

// MARK: - Test
let user = UserStruct(id: "U123", name: "Pratama")
let product = Product(id: "P456", title: "Macbook Pro")

user.describe()
product.describe()

// Real Case Sample
protocol Summable {
    static func +(lhs: Self, rhs: Self) -> Self
}

extension Array where Element: Summable {
    func sum() -> Element {
        reduce(self[0]) { $0 + $1 }
    }
}

extension Int: Summable {}
extension Double: Summable {}

let num = [1, 2, 3, 4, 5]
print(num.sum())

let doubles = [1.5, 2.5, 3.0]
print(doubles.sum())
