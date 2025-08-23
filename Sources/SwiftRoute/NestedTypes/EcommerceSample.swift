struct Product {
    let name: String
    let price: Double
    let category: Category
    let stockStatus: StockStatus
    let rating: Rating

    // Nested type for category
    enum Category {
        case electronics
        case fashion
        case food
        case pets
    }

    // Nested type for status stock
    enum StockStatus {
        case inStock(quantity: Int)
        case outOfStock
        case limitedStock(quantity: Int)

        func description() -> String {
            switch self {
                case .inStock(let qty):
                    return "Ready Stock: \(qty) pcs"
                case .outOfStock:
                    return "Currently Unvailable"
                case .limitedStock(let qty):
                    return "Hurry! Only \(qty) left"
            }
        }
    }

    // Nested type for product rating
    struct Rating {
        let stars: Int // 1 - 5
        let reviewCount: Int

        func summary() -> String {
            return "⭐️ \(stars) (\(reviewCount) reviews)"
        }
    }
}

// How to use
let iphone = Product (
    name: "IPhone 16",
    price: 1449.99,
    category: .electronics,
    stockStatus: .limitedStock(quantity: 3),
    rating: .init(stars: 5, reviewCount: 1024)
)

print("Product: \(iphone.name)")
print("Category: \(iphone.category)")
print("Price: $\(iphone.price)")
print("Stock: \(iphone.stockStatus.description())")
print("Rating: \(iphone.rating.summary())")