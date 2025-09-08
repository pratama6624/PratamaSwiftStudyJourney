// Sample Basic
public struct Library {
    // Default => Internal
    struct Book {
        var title: String
    }

    // Explicit public
    public struct Author {
        public var name: String
    }
}

let author = Library.Author(name: "Pratama") // Bisa diakses (public)
print(author.name)

let book = Library.Book(title: "Swift Guide") // Error kalau dipanggil dari luar module
print(book.title)

// Real Case
public struct APIClient {
    // Internal by default -> hanya bisa dipakai di dalam framework/module ini
    struct Config {
        let baseURL: String
    }

     public struct Data {}

    // Public -> Bisa dipakai developer yang pakai SDK kita
    public struct Response {
        public let statusCode: Int
        public let data: Data
    }

    public func fetchData() -> Response {
        return Response(statusCode: 200, data: Data())
    }
}