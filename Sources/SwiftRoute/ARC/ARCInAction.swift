import Foundation

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "Young One")

reference1 = nil // Still holds (p2)
reference2 = nil // Still holds (p3)
reference3 = nil // ARC works now