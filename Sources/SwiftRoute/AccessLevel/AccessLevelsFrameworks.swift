// MyNetworking Framework

// Bisa dipakai dari luar framework, tapi gak bisa di-subclass
public class HTTPClient {
    public init() {}

    public func get(_ url: String) {
        print("GET request to \(url)")
    }
}

// Bisa dipakai + di-subclass oleh project yang import 
open class BaseService {
    public init() {}

    open func fetchData() {
        print("Fetching data...")
    }
}

// Detail internal, gak bisa dipakai di luar framework
class InternalHelper {
    func log(_ message: String) {
        print("Log: \(message)")
    }
}

// How to use
// import MyNetworking // import framework

let client = HTTPClient()
client.get("https://api.example.com") // ✅ bisa

class UserService: BaseService {
    override func fetchData() {
        // ✅ bisa override karena BaseService `open`
        print("Custom fetching user data...")
    }
}

let helper = InternalHelper() // ❌ ERROR, karena gak public/open