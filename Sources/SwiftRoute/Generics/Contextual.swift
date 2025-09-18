protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct ShoppingCart<T>: Container {
    var items: [T] = []

    mutating func append(_ item: T) {
        items.append(item)
    }

    var count: Int {
        return items.count
    }

    subscript(i: Int) -> T {
        return items[i]
    }
}

func allItemsMatch<C1: Container, C2: Container>(
    _ someContainer: C1,
    _ anotherContainer: C2
) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {
    if someContainer.count != anotherContainer.count {
        return false
    }

    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    return true
}

var cart1 = ShoppingCart<String>()
cart1.append("iPhone")
cart1.append("MacBook")

var cart2 = ShoppingCart<String>()
cart2.append("iPhone")
cart2.append("MacBook")

if allItemsMatch(cart1, cart2) {
    print("Isi keranjang sama persis ✅")
} else {
    print("Isi keranjang beda ❌")
}