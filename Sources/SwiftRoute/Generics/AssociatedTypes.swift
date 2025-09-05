import Foundation

// Container Box Template
protocol Container {
    associatedtype Item
    mutating func add(_ item: Item)
    func getAll() -> [Item]
}

// Box of String
struct StringBox: Container {
    typealias Item = String
    private var items: [String] = []

    mutating func add(_ item: String) {
        items.append(item)
    }

    func getAll() -> [String] {
        return items
    }
}

var boxString = StringBox()
boxString.add("Hello")
boxString.add("World")
boxString.add("Bree")
print(boxString.getAll())

// Box of Int
struct IntBox: Container {
    typealias Item = Int
    private var items: [Int] = []

    mutating func add(_ item: Int) {
        items.append(item)
    }

    func getAll() -> [Int] {
        return items
    }
}

var boxInt = IntBox()
boxInt.add(1)
boxInt.add(4)
boxInt.add(2)
boxInt.add(9)
print(boxInt.getAll())

// Box of User
struct User {
    let id: Int
    let name: String
}

struct UserBox: Container {
    typealias Item = User
    private var items: [User] = []

    mutating func add(_ item: User) {
        items.append(item)
    }

    func getAll() -> [User] {
        return items
    }
}

var boxUser = UserBox()
boxUser.add(User(id: 1, name: "Pratama"))
boxUser.add(User(id: 2, name: "Young"))
boxUser.add(User(id: 3, name: "One"))
// boxUser.add("Pratama") Error
print(boxUser.getAll())
