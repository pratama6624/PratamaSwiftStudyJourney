struct Contact {
    var name: String
    var phone: String
    var email: String
}

// Extension -> Subscripts
extension Contact {
    subscript(key: String) -> String? {
        switch key.lowercased() {
            case "name":
                return name
            case "phone":
                return phone
            case "email":
                return email
            default:
                return nil
        }
    }
}

let contact = Contact(name: "Pratama", phone: "0851-6271-6624", email: "pratama@gmail.com")

print(contact["name"] ?? "Unknown")   // Output: Pratama
print(contact["phone"] ?? "Unknown")  // Output: 0851-6271-6624
print(contact["email"] ?? "Unknown")  // Output: pratama@mail.com
print(contact["address"] ?? "Unknown") // Output: Unknown