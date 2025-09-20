import Foundation

public class User {
    public let name: String
    public let role: String

    public init(name: String) {
        self.name = name
        self.role = "regular"
    }

    internal init(name: String, role: String) {
        self.name = name
        self.role = role
    }
}

let regularUser = User(name: "Pratama") // ✅ oke
print(regularUser.role) // "regular"

let adminUser = User(name: "Admin", role: "admin") // ✅ oke dalam modul
print(adminUser.role) // "admin"