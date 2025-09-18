import Foundation

protocol Box {
    associatedtype Item
    var items: [Item] { get }

    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}

struct FruitBox: Box {
    var items: [String] = []

    func makeIterator() -> IndexingIterator<[String]> {
        items.makeIterator()
    }
}

let box = FruitBox(items: ["Apple", "Banana", "Orange"])

for fruit in box.makeIterator() {
    print("Fruit: \(fruit)")
}