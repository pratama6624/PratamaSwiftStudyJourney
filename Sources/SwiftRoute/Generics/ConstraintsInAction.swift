import Foundation

// MARK: - Model Item (Equatable)
struct Item: Equatable {
    let id: Int
    let name: String
}

// MARK: - Generic findIndex with Type Constraint
func findIndex<T: Equatable>(od valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

// MARK: - Generic findAllIndexes with Type Constraint
func findAllIndexes<T: Equatable>(of valueToFind: T, in array: [T]) -> [Int] {
    var indexes: [Int] = []
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            indexes.append(index)
        }
    }
    return indexes
}

// MARK: - Example Usage
let inventory = [
    Item(id: 1, name: "Potion"),
    Item(id: 2, name: "Elixir"),
    Item(id: 3, name: "Sword"),
    Item(id: 4, name: "Shield"),
    Item(id: 3, name: "Sword"),
    Item(id: 1, name: "Potion"),
    Item(id: 4, name: "Shield"),
    Item(id: 1, name: "Potion")
]

// Find Index
if let index = findIndex(od: Item(id: 3, name: "Sword"), in: inventory) {
    print("Found Sword at index \(index)")
} else {
    print("Sword not found")
}

// Find Index
if let index = findIndex(od: Item(id: 6, name: "Bow"), in: inventory) {
    print("Found Bow at index \(index)")
} else {
    print("Bow not found")
}

// Find all index
let potionIndexes = findAllIndexes(of: Item(id: 1, name: "Potion"), in: inventory)
if potionIndexes.isEmpty {
    print("Potion not found")
} else {
    print("Potion found at indexes \(potionIndexes)")
}