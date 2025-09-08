// Sample Basic
protocol DataSource {
    associatedtype Item

    var items: [Item] { get }
    func item(at index: Int) -> Item
}

extension Array: DataSource {
    var items: [Element] { return self }

    func item(at index: Int) -> Element {
        return self[index]
    }
}

func printFirstItem<T: DataSource>(from dataSource: T) {
    if let first = dataSource.items.first {
        print("First item: \(first)")
    } else {
        print("No items found")
    }
}

let numbers = [1, 2, 3, 4, 5]
let names = ["Pratama", "Budi", "Citra"]

printFirstItem(from: numbers)  // First item: 1
printFirstItem(from: names)    // First item: Pratama

print(numbers.item(at: 2))     // 3
print(names.item(at: 1))       // Budi


// Real Case
struct MyViewModel<T: DataSource> {
    var dataSource: T

    func numberOfItems() -> Int {
        return dataSource.items.count
    }

    func titleForItem(at index: Int) -> String {
        return "\(dataSource.item(at: index))"
    }
}

let vm = MyViewModel(dataSource: ["iOS", "Swift", "Vapor"])
print(vm.numberOfItems())         // 3
print(vm.titleForItem(at: 0))     // "iOS"