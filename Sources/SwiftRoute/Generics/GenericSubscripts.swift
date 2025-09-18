import  Foundation

struct Inventory<Item> {
    private var items: [Item]

    init(items: [Item]) {
        self.items = items
    }

    // Basic Subscript
    subscript(index: Int) -> Item {
        return items[index]
    }

    subscript<Indices: Sequence>(indices: Indices) -> [Item] where Indices.Element == Int {
        var result: [Item] = []
        for index in indices {
            result.append(items[index])
        }
        return result
    }
}

let stock = Inventory(items: ["Tshirt", "Pants", "Shoes", "Bag", "Hat"])

// Get one item
print(stock[2]) // Shoes

// Get some item in the same time
let selected = stock[[0, 3, 4]]
print(selected)
