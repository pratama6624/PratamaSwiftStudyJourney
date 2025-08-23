struct Product {
    var name: String
    var price: Double
    var category: Category
    var status: Status

    enum Category: String {
        case electronics = "Electronics"
        case fashion = "Fashion"
        case food = "Food"
    }

    enum Status: String {
        case available = "Avaliable"
        case soldOut = "Sold Out"
    }
}

let newProduct = Product(
    name: "iPhone 16",
    price: 1500.0,
    category: Product.Category.electronics,
    status: Product.Status.available
)

print(newProduct.category.rawValue) // Electronics
print(newProduct.status.rawValue)   // Available