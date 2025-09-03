import Foundation

// Apple Docs
struct Dictionary<Key: Hashable, Value> {
    // Code Here
}

// Apple Docs
func findIndex<T: Equatable>(of value: T, in array: [T]) -> Int? {
    for(index, element) in array.enumerated() {
        if element == value {
            return index
        }
    }
    return nil
}

// Real Case
struct User: Hashable, Identifiable {
    var id: UUID
    var name: String
}

func uniqueItems<T:Hashable>(from items: [T]) -> [T] {
    var set = Set<T>()
    return items.filter { set.insert($0).inserted }
}

let users = [
    User(id: UUID(), name: "Pratama"),
    User(id: UUID(), name: "Budi"),
    User(id: UUID(), name: "Pratama") // Same name but different ID
]

let uniqueUsers = uniqueItems(from: users)
print(uniqueUsers)
