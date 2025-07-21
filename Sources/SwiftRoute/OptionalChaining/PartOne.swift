// Optional Chaining
// Optional Chaining as an Alternative to Forced Unwrapping
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()
print(john.residence ?? "nothing here")

// Error runtime
// let roomCount = john.residence!.numberOfRooms

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s)")
} else {
    print("unable to retrieve the number od rooms.")
}

john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s)")
} else {
    print("unable to retrieve the number od rooms.")
}

// Defining Model Classes for Optional Chaining