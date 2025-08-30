// Basic Protocol
protocol TextRepresentable {
    var textualDescription: String { get }
}

// Inheritance
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

// Struct
struct Product: PrettyTextRepresentable {
    var name: String
    var price: Double

    // From TextRepresentable
    var textualDescription: String {
        return "\(name) - $\(price)"
    }

    // From PrettyTextRepresentable
    var prettyTextualDescription: String {
        return """
        Product Info:
        - Name: \(name)
        - Price: \(price)
        """
    }
}

let iphone = Product(name: "iPhone 15", price: 999.99)

print(iphone.textualDescription)
// Output: iPhone 15 - $999.99

print(iphone.prettyTextualDescription)