// Docs Sample
struct Stack<Element> {
    var items: [Element] = []

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element {
        return items.removeLast()
    }
}

// Stack of String
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")

print(stackOfStrings.pop()) // "tres"
print(stackOfStrings.items) // ["uno", "dos"]

// Stack of Int
var stackOfInts = Stack<Int>()
stackOfInts.push(10)
stackOfInts.push(20)

print(stackOfInts.pop()) // 20
print(stackOfInts.items) // [10]

