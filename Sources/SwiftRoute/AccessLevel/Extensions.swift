import Foundation

// Public Module
public struct User {
    public let firstName: String
    public let lastName: String

    public init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

// Add internal extension
// (default access level)
extension User {
    func fullNameInternal() -> String {
        return "\(firstName) \(lastName)"
    }
}

// private extension
private extension User {
    func initials() -> String {
        return "\(firstName.first!)\(lastName.first!)"
    }
}