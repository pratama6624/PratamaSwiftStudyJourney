import Foundation

// Docs Sample
func printTwoValues<T, U>(_ one: T, _ two: U) -> Void {
    print("First value is \(one)")
    print("Second value is \(two)")
}
printTwoValues(1, "Two")

// Real Case Sample
// MARK: - Protocol Entity
protocol Entity: Codable, Identifiable where ID: Hashable {}

// MARK: - Example Models
struct User: Entity {
    let id: Int
    let name: String
    let email: String
}

struct Product: Entity {
    let id: String
    let title: String
    let price: Double
}

// MARK: - DataSource Protocol
protocol DataSource {
    associatedtype T: Entity
    func fetchAll() -> [T]
    func fetch(byId id: T.ID) -> T?
    func save(_ item: T)
}

// MARK: - API DataSource
class APIDataSource<T: Entity>: DataSource {
    private var storage: [T] = []

    func fetchAll() -> [T] {
        print("Fetching \(T.self) from API...")
        return storage
    }

    func fetch(byId id: T.ID) -> T? {
        print("Fetching \(T.self) with id \(id) from API...")
        return storage.first { $0.id == id}
    }

    func save(_ item: T) {
        print("Saving \(T.self) to API...")
        storage.append(item)
    }
}

// MARK: - Local Database DataSource
class LocalDataSource<T: Entity>: DataSource {
    private var storage: [T] = []

    func fetchAll() -> [T] {
        print("Fetching \(T.self) from Local DB...")
        return storage
    }

    func fetch(byId id: T.ID) -> T? {
        print("Fetching \(T.self) with id \(id) from Local DB...")
        return storage.first { $0.id == id}
    }

    func save(_ item: T) {
        print("Saving \(T.self) to Local DB...")
        storage.append(item)
    }
}

// MARK: - Generic Repository
class Repository<T: Entity, DS: DataSource> where DS.T == T {
    private let dataSource: DS

    init(dataSource: DS) {
        self.dataSource = dataSource
    }

    func getAll() -> [T] {
        dataSource.fetchAll()
    }

    func get(byId id: T.ID) -> T? {
        dataSource.fetch(byId: id)
    }

    func add(_ item: T) {
        dataSource.save(item)
    }
}

// MARK: - Usage
let userAPIRepo = Repository(dataSource: APIDataSource<User>())
let productLocalRepo = Repository(dataSource: LocalDataSource<Product>())

// Save Data
userAPIRepo.add(User(id: 1, name: "Pratama", email: "pratama@gmail.com"))
productLocalRepo.add(Product(id: "P-001", title: "IPhone 17 Air", price: 1_399))

// Fetch Data
print(userAPIRepo.getAll())
print(productLocalRepo.getAll())