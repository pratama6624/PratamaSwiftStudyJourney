// is operator
class Animal {}
class Cat: Animal {}
class Dog: Animal {}

let pet: Animal = Dog()

if pet is Dog {
    print("Is dog")
} else if pet is Cat {
    print("Is cat")
} else {
    print("Not both")
}

// downcasting as? & as!

class Bird: Animal {
    func bark() {
        print("Gak gak!")
    }
}

let mypet: Animal = Bird()

// Safe version (as?)
if let bird = mypet as? Bird {
    bird.bark()
}

// Forced version (as!)
// Have to careful because if the wrong type can crash
let bird2 = mypet as! Bird
bird2.bark()

// Upcasting (as)
let doggy = Dog()
let animal = doggy as Animal

// Any & AnyObject Casting
let items: [Any] = [5, "Swift", Bird()]

for item in items {
    if let number = item as? Int {
        print("Number: \(number)")
    } else if let text = item as? String {
        print("Text: \(text)")
    } else if let bird = item as? Bird {
        bird.bark()
    }
}