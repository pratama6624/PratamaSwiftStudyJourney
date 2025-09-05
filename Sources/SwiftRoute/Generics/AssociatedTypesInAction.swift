import Foundation

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntStack: Container {
    // Original IntStack Implementation
    var items: [Int] = []
    
    mutating func push(_ item: Int) {
        items.append(item)
    }

    mutating func pop() -> Int {
        return items.removeLast()
    }

    // Conformance to the Container protocol
    typealias Item = Int
    
    mutating func append(_ item: Int) {
        self.push(item)
    }

    var count: Int { return items.count }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

var intStack = IntStack()
intStack.append(20)
intStack.append(40)
intStack.append(10)
print(intStack.count)   // 3
print(intStack[1])      // 40

struct Stack<Element>: Container {
    // original Stack<Element> implementation
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

var stringStack = Stack<String>()
stringStack.append("Hello")
stringStack.append("World")
print(stringStack.count)   // 2
print(stringStack[0])      // "Hello"


// In Array Extension
extension Array: Container {}

var animals: Array<String> = ["Cat", "Dog", "Bird"]
print(animals.count)    // 3
print(animals[1])       // Dog


func printAllItems<C: Container>(_ container: C) {
    for i in 0..<container.count {
        print(container[i])
    }
}

printAllItems(intStack)       // Bisa pake IntStack
printAllItems(stringStack)    // Bisa pake Stack<String>
printAllItems(animals)        // Bisa pake Array