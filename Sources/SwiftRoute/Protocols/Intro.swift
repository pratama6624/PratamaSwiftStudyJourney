// Protocols (SWIFT) -> Interface (JAVA)
protocol Drivable {
    var brand: String { get }
    func startEngine()
    func drive()
}

// Struct confort protocol
struct Car: Drivable {
    let brand: String

    func startEngine() {
        print("\(brand) engine started!")
    }

    func drive() {
        print("\(brand) is now driving...")
    }
}

// struct confort protocol
struct Motorcycle: Drivable {
    let brand: String
    
    func startEngine() {
        print("\(brand) engine roaring!")
    }
    
    func drive() {
        print("\(brand) is speeding away!")
    }
}

// How to use
let tesla = Car(brand: "Tesla")
tesla.startEngine()
tesla.drive()

let ducati = Motorcycle(brand: "Ducati")
ducati.startEngine()
ducati.drive()