import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    try app.register(collection: BasicsController())
    
    // NOTE
    // 3. SET DATABASE CUSTOM DENGAN AZURE (POSTGRE SQL)
    // 4. TERAPKAN ENVIRONMETN UNTUK MENYIMPAN DATA SET SENSITIVE
    // 5. TERAPKAN SEMUA ROAD BASIC SWIFT (LIHAT DI README)
}
