// Main Module: MyApp
class UserManager {
    // Internal, default access level
    func loadUser() -> String {
        return "Pratama"
    }
}

// Unit Test Target: MyAppTests
import XCTest

@testable import MyApp // << here the key

final class UserManagerTests: XCTestCase {
    func testLoadUser() {
        let manager = UserManager()
        XCTAssertEqual(manager.loadUser(), "Pratama") // √
        // Bisa diakses walaupun internal
    }
}