struct Dictionary<Key, Value> {
    // Key for key
    // Value for content
}

struct Pair<First, Second> {
    var first: First
    var second: Second
}

func swapValue<T>(_ one: T, _ two: T) -> Void {
    var temp = one
    one = two
    two = temp
}

// Alternative -> Lightweight Syntax
func makeArray() -> some Collection {
    return [1, 2, 3, 4, 5]
}

// Real Case
struct APIResponse<DataType> {
    let statusCode: Int
    let message: String
    let data: DataType
}

struct User {
    let name: String
}

struct Product {
    let id: Int
    let name: String
}

let userResponse = APIResponse<User>(
    statusCode: 200,
    message: "Success",
    data: User(name: "Pratama")
)

let productResponse = APIResponse<Product>(
    statusCode: 200,
    message: String,
    data: Product(id: 1, name: "IPhone 16")
)