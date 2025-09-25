import Foundation

class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var pratama: Person?
var unitA123: Apartment?

pratama = Person(name: "Pratama")
unitA123 = Apartment(unit: "A123")

pratama!.apartment = unitA123
unitA123!.tenant = pratama

pratama = nil
unitA123 = nil

// NOTE : ARC never work because swift thinks they still exist because they are bound to each other