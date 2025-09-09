// Sample Basic
protocol Container {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

// Real Case
struct Cart<Item: Equatable>: Container {
    private var items: [Item] = []

    mutating func append(_ item: Item) {
        items.append(item)
    }

    var count: Int {
        return items.count
    }

    subscript(i: Int) -> Item {
        return items[i]
    }

    // Extra
    mutating func remove(_ item: Item) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}

var cart = Cart<String>()
cart.append("IPhone")
cart.append("MacBook")
print(cart.count) // 2
print(cart[0]) // IPhone

cart.remove("IPhone")
print(cart.count) // 1
print(cart[0]) // IPhone

// Error Sample
// struct Product { let name: String }

var cart1 = Cart<Product>() // Error != Equatable

// Solusion
struct Product: Equatable {
    let name: String
}