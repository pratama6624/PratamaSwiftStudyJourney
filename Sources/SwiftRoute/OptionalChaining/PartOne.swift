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
class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?

    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

class NewResidence {
    var rooms: [Room] = []

    var numberOfRooms: Int {
        return rooms.count
    }

    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }

    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

class NewPerson {
    var residence: NewResidence?
}

let newResidence = NewResidence()

newResidence.rooms.append(Room(name: "Living Room"))
newResidence.rooms.append(Room(name: "Kitchen"))
newResidence.rooms.append(Room(name: "Dining Room"))
// Add address
let address = Address()
address.buildingNumber = "42"
address.street = "Baker Street"
newResidence.address = address

print(newResidence.printNumberOfRooms())

// Accessing Properties Through Optional Chaining

let young = NewPerson()
young.residence = NewResidence()
young.residence?.rooms.append(Room(name: "Living Room"))
if let roomCount = young.residence?.numberOfRooms {
    print("Young's residence has \(roomCount) room(s)")
} else {
    print("Unable to retrieve the number of rooms")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
young.residence?.address = someAddress

if let street = young.residence?.address?.street {
    print("Young street address is on \(street)")
} else {
    print("I dont know it broo")
}

let one = NewPerson()
one.residence = NewResidence()
one.residence?.rooms.append(Room(name: "Living Room"))
one.residence?.rooms.append(Room(name: "Dining Room"))
one.residence?.rooms.append(Room(name: "Kichen"))
one.residence?.rooms.append(Room(name: "Bathroo"))

func createAddress() -> Address {
    print("This function was called")
    
    let someAddress = Address()
    someAddress.buildingNumber = "31"
    someAddress.street = "Dragon road"

    return someAddress
}
one.residence?.address = createAddress()

if let buildingNumber = one.residence?.address?.buildingNumber {
    print("One building number is \(buildingNumber)")
} else {
    print("I dont know it broo")
}

// Calling Methods Through Optional Chaining
