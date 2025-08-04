// import Foundation

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

print("-------------------------------------------------------")

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

    // Side effect or Ga ngembaliin apapun
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

print("-------------------------------------------------------")

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
someAddress.buildingNumber = "The Flower 29"
someAddress.street = "The Acacia Road"
young.residence?.address = someAddress

if let street = young.residence?.address?.street {
    print("Young street address is on \(street)")
} else {
    print("I dont know it broo")
}

let one = NewPerson()
one.residence = NewResidence()
one.residence?.rooms.append(Room(name: "Dining Room"))
one.residence?.rooms.append(Room(name: "Living Room"))
one.residence?.rooms.append(Room(name: "Kichen"))
one.residence?.rooms.append(Room(name: "Bathroo"))

func createAddress() -> Address {
    print("This function was called")
    
    let someAddress = Address()
    someAddress.buildingNumber = "The Flower 31"
    someAddress.street = "The Dragon road"

    return someAddress
}
// one.residence?.address = createAddress()

if let buildingNumber = one.residence?.address?.buildingNumber {
    print("One building number is \(buildingNumber)")
} else {
    print("I dont know it broo")
}

print("-------------------------------------------------------")

// Calling Methods Through Optional Chaining
// Hanya digunakan untuk mengecek apakah sebuah fungsi berhasil dieksekusi atau tidak dan tidak mengembalikan suatu nilai
// Contoh : Mengecek apakah fungsi side effect seperti printNumberOfRooms() berhasil dijalankan atau tidak
print(newResidence.printNumberOfRooms()) // Mengembalikan fungsi
if one.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

if (one.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}

print("-------------------------------------------------------")

// Accessing Subscripts Through Optional Chaining
// Let's try with optional chaining
if let firstRoomName = one.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

// Accessing Subscripts of Optional Type
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72

print(testScores)

print("-------------------------------------------------------")

// Linking Multiple Levels of Chaining
if let oneStreet = one.residence?.address?.street {
    print("One's street name is \(oneStreet).")
} else {
    print("Unable to retrieve the address.")
}

print("-------------------------------------------------------")

// Chaining on Methods with Optional Return Values
if let buildingIdentifier = one.residence?.address?.buildingIdentifier() {
    print("One's building identifier is \(buildingIdentifier).")
}

if let beginsWithThe = one.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("One's building identifier begins with \"The\".")
    } else {
        print("One's building identifier doesn't begin with \"The\".")
    }
}