import Foundation

public struct Product {
    public var name: String
    private var internalId: String

    // No init
}

// Other Module
// Error
// let p = Product(name: "Labtop", internalId: "ABC123")

// Solution

// SDK Module
public struct OtherProduct {
    public var name: String
    private var internalId: String

    public init(name: String, internalId: String) {
        self.name = name
        self.internalId = internalId
    }
}

// Other Module
let pp = OtherProduct(name: "Labtop", internalId: "ABC123")
// Success