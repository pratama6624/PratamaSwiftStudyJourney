protocol Identifiable {
    init(id: String)
}

// Sample -> struct
struct User: Identifiable {
    var id: String

    init(id: String) {
        self.id = id
    }
}

let u = User(id: "USR-001")
print(u.id) // USR-001

// Sample -> class
class Employee: Identifiable {
    var id: String

    required init(id: String) {
        self.id = id
    }
}

let uu = Employee(id: "USR-002")
print(uu.id)

// Sample -> class (required)
protocol HasDefaultInit {
    init()
}

class Base {
    init() {
        print("Base ini dipanggil")
    }
}

class Manager: Base, HasDefaultInit {
    required override init() {
        print("Manager init dipanggil")
        super.init()
    }
}

// Sample Advanced
protocol JSONInitializable {
    init?(json: [String: Any])
}

struct Product: JSONInitializable {
    var name: String
    var price: Double

    init?(json: [String: Any]) {
        guard let name = json["name"] as? String,
        let price = json["price"] as? Double else {
            return nil
        }

        self.name = name
        self.price = price
    }
}

let validJSON: [String: Any] = ["name": "IPhone", "price": 15_000_000.0]
let invalidJSON: [String: Any] = ["name": "IPhone"]

if let product = Product(json: validJSON) {
    print("Produk: \(product.name), Rp\(product.price)")
} else {
    print("Failed")
}

print(Product(json: invalidJSON) == nil) // true (gagal)
