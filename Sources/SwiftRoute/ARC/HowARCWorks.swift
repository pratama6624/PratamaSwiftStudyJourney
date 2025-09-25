import Foundation

class Person {
    var name: String

    init(name: String) {
        self.name = name
        print("\(name) created")
    }

    deinit{
        print("\(name) removed from memory")
    }
}

var p1: Person? = Person(name: "Pratama")
var p2: Person? = p1 // p2 same instance

p1 = nil // ARC has not been deleted because p2 still holds it
p2 = nil // ARC works now